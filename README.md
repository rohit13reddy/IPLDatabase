
The zip file submitted consists of project.sql,MiniWorld.py and README.md
1. project.sql consists of all the queries required to populate the database.
2. MiniWorld.py consits of all the functional requirements and queries

## COMMANDS:
TO EXECUTE THE BELOW COMMANDS ENTER THE NUMBER MENTIONED IN THE SQUARE BRACKETS. 
1. INSERT PLAYER [1]
-> This command is used to add a new player into the database.
-> This command asks player_id,franchise name for which he plays and name of the franchise owner and player name,nationality of the player,ipl debut year(dd-mm-yyyy),date of birth from the user.
2. INSERT FRANCHISE [2]
-> This command is used to add a new franchise into the database
-> This command asks franchise name,owner name,home stadium of the franchise,coach of the franchise from the user.
3. DELETE PLAYER [3]
-> This command is used to delete a player from the database
-> This command asks for player_id of the player to be deleted from the user.
4. DELETE LEAGUE SPONSOR [4]
-> This command is used to delete a league sponsor from the database
-> This command asks for name of the league sponsor to be deleted from the user
5. UPDATE COMMENTATOR LANGUAGE [5]
-> This command is used to change the language of the commentator in a specific match.
-> This command asks for name of the commentator and the match id at which language needs to be updated and the updated language of the commentator from the user.
6. UPDATE LEAGUE SPONSOR TYPE [6]
-> This command is used to change the sponsorship type of the league sponsor(eg: TITLE SPONSOR->ASSOCIATE SPONSOR)
-> This command asks for name of the sponsor whose sponsorship type should be updated and the new sponsorship type to which it should be changed from the user.
7. UPDATE SEATING CAPACITY [7]
-> This command is used to change the seating capacity of a stadium
-> This command asks for the name of the stadium whose seating capacity is to be changed and the new seating capacity to which it should be changed.
8. GET AVERAGE SCORE BATSMEN [8]
-> This command gives the average score of the batsmen in the entire league.
-> This command asks for the player_id whose average score is to be computed from the user.
9. BOWLERS MORE THAN "K" WICKETS [9]
-> This command gives the list of bowlers whose number of wickets are greater than k in the entire league.
-> This command asks for value of k from the user.
10. COMMENTATORS OF A LANGUAGE [10]
-> This command gives the list of commentators who comment in a specific language.
-> This command asks for language from the user.
11. AGE [11]
-> This command gives the age of the player.
-> This commands asks for player_id whose age is to be computed from the user.
12. STADIUMS SEATING CAPACITY LESS THAN "K" [12]
-> This command gives the list of stadiums whose maximum seating capacity is less than k.
-> This command asks for the value of k from the user.
13. EXIT [13]
-> This command can be used to exit from the python script.
