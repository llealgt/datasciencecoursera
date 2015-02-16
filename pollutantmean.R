#directory = el directorio donde se encuentran lsos archivos
#pollutant =a cual columna se le desea sacar la media
#ID= que archivos se desean incluir en el calculo
pollutantmean<-function(directory,pollutant,ID=1:332)
{
	#recorrer la secuencia de ids 
	for(index in ID){
		#generar el path del archivo a leer concatenando el directorio y el id(formateado de la forma NNN,con ceros al inicio
		archivo<-c(directory,"/",formatC(index,width=3,flag=0),".csv");
		path <-paste(archivo,collapse="");
		
		#unir los datasets de cada id
		if(exists("dataset")){
			dataset<-merge(dataset,read.csv(path),all=TRUE);
		}
		else{
			dataset<-read.csv(path);
		}
	}
	#devolver la media del dataset 
	mean(dataset[[pollutant]],na.rm=TRUE);
}
