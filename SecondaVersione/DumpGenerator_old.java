import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.ProcessBuilder.Redirect;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Map;
import java.util.logging.Level;

public class DumpGenerator {
	
	//string that gets the OS name. Useful in the future if we will need to run this software on different operative systems
	private static String OS = System.getProperty("os.name").toLowerCase();
	
	public static void main(String args[]) throws IOException, InterruptedException {
		
		
		//String array that contains the command to compile the C program that looks for trojans in the registers' dump file
		String[] args2 = new String[3];
		String scriptPath = "";
		
		BufferedReader reader = new BufferedReader(new FileReader(new File("conf.txt")));
		String text = null;
		String[] inputPaths = new String[Integer.parseInt(reader.readLine())];
		int i = 0;

	    while ((text = reader.readLine()) != null) {
	        inputPaths[i] = text;
	        i++;
	    }
		
		//if useful in the future if we will have to differentiate between operative systems
		if (isWindows()) {
			System.out.println("This is Windows");
			//command to compile the C program that looks for trojans in the gdb.txt file
			args2 = new String[] {"/bin/bash", "-c", "gcc ricerca.c"};
			//building the process needed for the script that generates the registers' dump file
			scriptPath = "./batch_script.bat";
		} else if (isMac() || isUnix()) {
			//command to compile the C program that looks for trojans in the gdb.txt file
			args2 = new String[] {"/bin/bash", "-c", "gcc ricerca.c"};
			//building the process needed for the script that generates the registers' dump file
			scriptPath = "./bash_script.sh";
		}
		
		//compiling the C file
		Process proc = new ProcessBuilder(args2).start();
		
		int nIterations = inputPaths.length;
		File folder = new File("gdbResults");
		if(folder.exists()) {
			String[]entries = folder.list();
			for(String s: entries){
			    File currentFile = new File(folder.getPath(),s);
			    currentFile.delete();
			}
			folder.delete();
		}
		boolean folderSuccess = (new File("gdbResults")).mkdirs();
		if (!folderSuccess) {
		    System.out.println("Directory creation failed.");
		}
		
		//loop for the number of iterations chosen
		for(i = 0; i<nIterations; i++) {
			
			ProcessBuilder script = new ProcessBuilder(scriptPath, inputPaths[i]);
			
			//it is necessary to redirect the errors and the output stream of the script to a log file otherwise it won't produce the dump file for complex programs in C
			File log = new File("log");
			script.redirectErrorStream(true);
			script.redirectOutput(Redirect.appendTo(log));
			//starting the execution of the script in bash that generates the dump file "gdb.txt"
			Process scriptProc = script.start();
			//stops the thread until the execution is ended
			scriptProc.waitFor();
			
			deleteLastLines("gdb.txt");
			
			//renaming the dump file of this iteration with the iteration number so that we can associate it to its iteration
			File file = new File("gdb.txt");
			File file2 = new File("gdbResults/gdb"+(i+1)+".txt");
			boolean success = file.renameTo(file2);
		}
	}
	
	//removes the last useless line to the dump file
	//the technique used to do so consists of copying the content of the dump file into a temporary file until the last useful line and then stopping the copying process.
	//after that we can rename the temporary file with the name of the original file and overwrite it leaving only the copy we have done
	public static void deleteLastLines(String gdbName) {
		File inputFile = new File(gdbName);
		File tempFile = new File("tempGdb.txt");
		
		try {
			BufferedReader reader = new BufferedReader(new FileReader(inputFile));
			BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));
			
			//after this string is find in a line we ignore the remaining part of the dump file and don't copy it in the tempFile
			String lineToRemove1 = "__libc_start_main";
			String lineToRemove2 = "Function(s)";
			String lineToRemove3 = "Breakpoint";
			String currentLine;
			
			while((currentLine = reader.readLine()) != null) {
				//until we don't find the line to remove we keep copying the content of the dump into the temporary file
				//when we find that line we stop the copying process exiting the loop
				if(!currentLine.contains(lineToRemove1) && !currentLine.contains(lineToRemove2) && !currentLine.contains(lineToRemove3)) {
					writer.write(currentLine+"\n");
				} else if(currentLine.contains(lineToRemove1)){
					break;
				}
			}
			
			writer.close();
			reader.close();
			//renaming the temporary file with the original dump file name, overwriting it
			boolean successful = tempFile.renameTo(inputFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	//method used to know if this OS is windows
	public static boolean isWindows() {

		return (OS.indexOf("win") >= 0);

	}

	//method used to know if this OS is macos
	public static boolean isMac() {

		return (OS.indexOf("mac") >= 0);

	}

	//method used to know if we are on unix or linux
	public static boolean isUnix() {

		return (OS.indexOf("nix") >= 0 || OS.indexOf("nux") >= 0 || OS.indexOf("aix") > 0 );
		
	}
}
