# Football League Database
## PostgreSQL database of fictitious players and clubs with GUI made in Java
### Introduction
Combining my two passions of football and computer science, I've decided to create an app - a database with graphical interface. I have invented 16 names of clubs from various European capital cities and almost 400 players with "quasi-typical" for their countries fore- and surnames. My goal is to prepare SQL file that sets database containing those clubs and players and write program that will let users visualise the data.
### Work schedule
#### Stage 1
Draw scheme of relational database and implement tables in SQL
#### Stage 2
Fill that database with essential records
#### Stage 3
Create GUI
### Progress
#### Stage 1 - DONE
I have created database scheme using Dia. It consists of four relations - teams, players, games and stats. The purpose of first three of them is rather clear. Nevertheless, fourth one can be tricky - it includes individual "review" (such as played minutes, scored goals etc) of every player who took part in certain game. Then I've changed that model into existing but empty database. 
Origin of some numbers from scheme:
- teams 1..1 -- 30..30 hosts (aways) - given n teams, the number of all matchdays (including rematches) equals 2(n-1). Therefore for n = 16 we get 30 matchdays
- teams 1..1 -- 14..30 players - subjectively chosen interval (at least 14 players in one team in order to have a possibility to make 3 changes in one game)
- teams 1..1 -- 330..420 stats - number of players from same team in certain game is from interval <11;14>. Therefore, for 30 different games we get 30*<11;14> = <330;420> unique stats of participants 
#### Stage 2 - DONE
I have written scripts in Python that helped me filling database. File calendar.py generates all record referring to relation "games" and "stats.py" creates all stats for ONE team. The admin's tasks are:
- checking whether players punished with red card (and therefore suspended) won't take part in next match
- setting proper minutes of events just as goals, assists cards
- manipulating played minutes of players if any player substitution occurs
#### Stage 3 - NOT DONE YET
I am currently working on Java GUI
### Technologies
#### PostgreSQL
Database
#### Java
GUI
#### Python
Scripts for generating data
