#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <conio.h>
#include <windows.h>

char *strlower(char *s)		
{
  char *cp;
  if ( !(cp=s) )
    return NULL;

  while ( *s != 0 ) {
    *s = tolower( *s );
    s++;
  }
  return cp;
}

int ShouldHideProcess(char* exe){
	
	int found = 0;

	if(exe==0) return 0;
	char* tmp = strlower(strdup(exe));
	char* hide[] = {"sniff_hit","sysanalyzer","windump","olly","api_logger", NULL};
	
	int i = 0;
	while(hide[i] != 0){
		if(strstr(tmp, hide[i]) > 0){
			found = 1; 
			break; 
		}
		i++;
	}

	printf("final i=%d", i);
	free(tmp);
	return found;

}

void main(void){

	char* exes[5] = {"c:\\windows\\calc.exe", "c:\\windump.exe","C:\\hfjdfdklsjl\\sysanalyzer.exe"};

	for(int i=0;i<3;i++){
		printf("hide: %s = %d\n", exes[i], ShouldHideProcess(exes[i]) );
	}
	
	getch();


}