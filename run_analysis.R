library(dplyr)

Caracteristica <- read.table("features.txt", 
                       col.names = c("n","Funciones"))
Actividades <- read.table("activity_labels.txt", 
                         col.names = c("code", "activity"))
Sujetos_prueba <- read.table("subject_test.txt", 
                           col.names = "subject")
x_test <- read.table("X_test.txt", 
                     col.names = Caracteristica$Funciones)
y_test <- read.table("y_test.txt", 
                     col.names = "code")
Sujetos_entrenamiento <- read.table("subject_train.txt", 
                            col.names = "subject")
x_train <- read.table("X_train.txt", 
                      col.names = Caracteristica$Funciones)
y_train <- read.table("y_train.txt", 
                      col.names = "code")


X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Sujeto <- rbind(Sujetos_entrenamiento, Sujetos_prueba)
Datos_Juntos <- cbind(Sujeto, Y, X)



Datos_organizados <- Datos_Juntos %>% select(subject, code, contains("mean"), 
                                   contains("std"))


Datos_organizados$code <- Actividades[Datos_organizados$code, 2]



names(Datos_organizados)[2] = "activity"
names(Datos_organizados)<-gsub("Acc", "Accelerometer", 
                               names(Datos_organizados))
names(Datos_organizados)<-gsub("Gyro", "Gyroscope", 
                               names(Datos_organizados))
names(Datos_organizados)<-gsub("BodyBody", "Body", 
                               names(Datos_organizados))
names(Datos_organizados)<-gsub("Mag", "Magnitude", 
                               names(Datos_organizados))
names(Datos_organizados)<-gsub("^t", "Time", 
                               names(Datos_organizados))
names(Datos_organizados)<-gsub("^f", "Frequency", 
                               names(Datos_organizados))
names(Datos_organizados)<-gsub("tBody", "TimeBody", 
                               names(Datos_organizados))
names(Datos_organizados)<-gsub("-mean()", "Mean", 
                               names(Datos_organizados), 
                               ignore.case = TRUE)
names(Datos_organizados)<-gsub("-std()", "STD", 
                               names(Datos_organizados), 
                               ignore.case = TRUE)
names(Datos_organizados)<-gsub("-freq()", "Frequency", 
                               names(Datos_organizados), 
                               ignore.case = TRUE)
names(Datos_organizados)<-gsub("angle", "Angle", 
                               names(Datos_organizados))
names(Datos_organizados)<-gsub("gravity", "Gravity", 
                               names(Datos_organizados))



FinalData <- Datos_organizados %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)