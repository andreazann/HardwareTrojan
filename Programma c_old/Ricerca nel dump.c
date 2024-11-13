#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//La funzione strstr(a,b) trova la stringa memorizzata in "b" all'interno della stringa memorizzata in "a"
int main()
{
   long int size_fp0, size_fp1, size_tmp0, size_tmp1;
   int j, k, m, n, f, ret, ret0, ret2, ret4, ret6;
   int a = 1;
   int i = 1; //Contatore delle righe che leggo dal file in cui c'è il dump
   char s0[255]; //variabili per la strtok
   char s1[255]; //variabili per la strtok
   char s2[255]; //variabili per la strtok
   char del[2] = " "; //variabili per la strtok
   char *pn0;  //variabili per la strtok
   char *pn1; //variabili per la strtok
   char *p0;  //variabili per la strtok
   char *p1;  //variabili per la strtok
   char *p2;
   char *p3;
   char *p4;
   char *p5;
   char *p6;
   char *p7;
   char *p8;
   char *p9;
   char *ret1;
   char *ret3;
   char *ret5;
   char *ret7;
   FILE *fp0;
   FILE *fp1;
   FILE *fp2;
   char buff00[255];
   char buff01[255];
   char buff10[255];
   char buff11[255];
   fpos_t position0;
   fpos_t position1;
   fpos_t position2;
   fpos_t start_position;
   fpos_t start_position1;
   fpos_t start_position2;

   fp2 = fopen("output.txt","a"); //Modalità a permette di aprire il file e scrivere senza eliminare ciò che c'era prima

   fp0 = fopen("GeneratedTrigger.txt","rb");
   fseek(fp0,0,SEEK_END);
   size_fp0 = ftell(fp0);
   fseek(fp0,0,SEEK_SET);


   while (size_tmp0 < size_fp0)
   {
    fgets(buff00, 255,fp0);
    fgetpos(fp0, &position0);
    fsetpos(fp0,&position0);
    start_position1 = position0; //Memorizzo la posizione da dove ripartire nel caso sono a cavallo di due set di trigger
    for(j=0;j<255;j++) //copio ciò che ho letto in un altro array perchè mi serve tenere memorizzato ciò che leggo in buff00
    {
        s0[j]=buff00[j];
    }
    pn0 = strtok(s0,del);
    p0 = strtok(NULL,del);
    p1 = strtok(NULL,del);

    p1[strlen(p1)-1] = p1[strlen(p1)];  //Elimino il carattere "\n" dalla stringa così riesco a confrontarla con la strstr()

    do
    {
        fgets(buff01, 255,fp0);
        fgetpos(fp0, &position0);
        fsetpos(fp0,&position0);
        for(j=0;j<255;j++)
        {
            s1[j]=buff01[j];
        }
        pn1 = strtok(s1,del);
        p2 = strtok(NULL,del);
        p3 = strtok(NULL,del);

        p3[strlen(p3)-1] = p3[strlen(p3)];  //Elimino il carattere "\n" dalla stringa così riesco a confrontarla con la strstr()

        //Dentro l'if controllo il file gdb.txt (il file di dump)
        if(!strcmp(pn0,pn1)) //Mi serve nel caso in cui abbia soltanto un trigger e non una coppia di trigger (1 *registro* e la riga dopo è 2 *registro*)
        {
            i = 1;  //Reinizializzo il contatore di righe del dump
            fp1 = fopen("gdb.txt", "rb");
            fseek(fp1,0,SEEK_END);
            size_fp1 = ftell(fp1);
            fseek(fp1,0,SEEK_SET);

            fgets(buff10,255,fp1);   //Salto la 1° riga di gdb.txt
            fgetpos(fp1, &position1);
            fsetpos(fp1,&position1);
            while(1)
            {
                for(k=0;k<3;k++)
                {
                    fgets(buff10,255,fp1);   //Salto le 3 righe che stanno tra il primo registro dell'istruzione i-esima e l'ultimo registro dell'istruzione (i-1)-esima
                    fgetpos(fp1, &position1);
                    fsetpos(fp1,&position1);
                }
                start_position = position1; //Memorizzo la posizione del primo registro (r0) dell'istruzione
                for(m=0;m<17;m++) //itero per 13 volte, tante quanti sono i registri dumpati per  ogni istruzione
                {
                    fgets(buff10,255,fp1); //Legge da file fino al carattere newline (\n)
                    fgetpos(fp1, &position1); //Recupera la posizione a cui siamo arrivati
                    fsetpos(fp1,&position1);

                    for(f=0;f<255;f++)
                    {
                        s2[f]=buff10[f];
                    }

                    p4 = strtok(s2,del);
                    p5 = strtok(NULL,del);
                    p6 = strtok(NULL,del);

                    if(p4 == NULL || p5 == NULL)
                    {
                        break;
                    }

                    ret0 = strcmp(p4,p0);
                    ret1 = strstr(p5,p1);
                    ret2 = strcmp(p4,p2);
                    ret3 = strstr(p5,p3);

                    if(((ret0 == 0) && (ret1 != NULL)) || ((ret2 == 0) && (ret3 != NULL)) ) //Controlliamo se siamo sulla riga del registro corretta con il valore corretto
                    {
                        fsetpos(fp1, &start_position); //Posizioniamoci all'inizio del dump dell'istruzione per verificare se c'è il secondo elemento della coppia di trigger

                        for(n=0;n<17;n++) //Cerchiamo il secondo trigger facente parte della coppia
                        {
                            fgets(buff11,255,fp1);
                            fgetpos(fp1, &position2);
                            fsetpos(fp1,&position2);

                            for(f=0;f<255;f++)
                            {
                                s2[f]=buff11[f];
                            }

                            p7 = strtok(s2,del);
                            p8 = strtok(NULL,del);
                            p9 = strtok(NULL,del);

                            if(p7 == NULL || p8 == NULL)
                            {
                                break;
                            }

                            ret4 = strcmp(p7,p0);
                            ret5 = strstr(p8,p1);
                            ret6 = strcmp(p7,p2);
                            ret7 = strstr(p8,p3);

                            //Non va bene l'OR; devo mettere una condizione in funzione di ciò che mi fa entrare nel primo IF

                            if((ret0 == 0) && (ret1 != NULL))
                            {
                                if((ret6 == 0) && (ret7 != NULL))
                                {
                                    fprintf(fp2, "%s %d %s %d\n","Trojan numero", a, ": trigger trovato all'istruzione", i);
                                    //printf("Trojan numero %d: trigger trovato all'istruzione %d\n", a, i);
                                    break;
                                }
                            }
                            else
                            {
                                if((ret4 == 0) && (ret5 != NULL))
                                {
                                    fprintf(fp2, "%s %d %s %d\n","Trojan numero", a, ": trigger trovato all'istruzione", i);
                                    //printf("Trojan numero %d: trigger trovato all'istruzione %d\n", a, i);
                                    break;
                                }
                            }
                        }
                        //break; non lo metto perchè devo comunque posizionarmi sulla prima riga dopo il registro cpsr
                    }

                }
                size_tmp1 = ftell(fp1);
                if(size_tmp1 >= size_fp1) //if(strstr(buff10,pf) != NULL)
                {
                    break;
                }
                i++;
            }
        }
        else
        {
            fsetpos(fp0,&start_position1);
            ret = strcoll(pn0,pn1);
            if(ret > 0) //Siamo passati ai trigger di un altro trojan
            {
                a++;
                while((strcoll(pn0,pn1)) > 0)  //Finchè ho pn0=4 e pn1=1 devo spostarmi per leggere il set di trigger corretto
                {
                    fgets(buff00, 255,fp0);
                    fgetpos(fp0, &position0);
                    fsetpos(fp0,&position0);
                    start_position1 = position0; //Serve per non ricominciare dalla posizione start_position1 (che è vecchia)
                    for(j=0;j<255;j++) //copio ciò che ho letto in un altro array perchè mi serve tenere memorizzato ciò che leggo in buff00
                    {
                        s0[j]=buff00[j];
                    }
                    pn0 = strtok(s0,del);
                    p0 = strtok(NULL,del);
                    p1 = strtok(NULL,del);
                }
            }
        }
        if(position0 == size_fp0) //Se sono arrivato alla fine del file, interrompi. Non uscivo dal while per aggiornare size_tmp0, perciò rimanevo in loop senza mai uscire
        {
            break;
        }

    } while(!strcmp(pn0,pn1));  //Confronta se i due registri fanno parte dello stesso set di trigger (entrambi sono sotto gli 1 ad esempio)
    size_tmp0 = ftell(fp0);
   }
    return 0;
}
