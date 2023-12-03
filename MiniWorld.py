import subprocess as sp
import pymysql
import pymysql.cursors
from datetime import date


def age_cal(birthDate): 
    days_in_year = 365.2425 
    age = int((date.today()- birthDate).days / days_in_year)
    return age


def GET_AVG_SCORE_BATSMEN():
    try:
        player_id=int(input("Enter player_id of the player whose avg_score in the tournament is to be given: "))
        query="SELECT AVG(Number_of_Runs) FROM Batting_Info WHERE Player_ID=%d" % player_id
        cur.execute(query)
        avg_score=cur.fetchall()
        print(avg_score[0]["AVG(Number_of_Runs)"])
        con.commit()
    except Exception as e:
        con.rollback()
        print('Failed to get avg_score from Database')
        print(">>>>>>>>>>>>>", e)

def BOWLERS_MORE_THAN_K_WICKETS():
    try:
        k=int(input("Enter the value of k: "))
        query="SELECT Player_ID,SUM(Number_of_Wickets) FROM Bowling_Info GROUP BY Player_ID HAVING SUM(Number_of_Wickets) > %d" % k
        cur.execute(query)
        bowlers=cur.fetchall()
        player_ids=[]
        names=[]
        for i in bowlers:
            player_ids.append(i["Player_ID"])    
        for j in player_ids:
            query1="SELECT Name FROM Player WHERE Player_ID=%d" % j
            cur.execute(query1)
            x=cur.fetchall()
            name=x[0]["Name"]
            names.append(name)
        print("Player_ID -- Name")
        for k in range(len(player_ids)):
            print("%s--%s" % (player_ids[k],names[k]))
        con.commit()                
    except Exception as e:
        con.rollback()
        print("Failed to get list of bowlers with number of wickets greater than k")
        print(">>>>>>>>>>>>>", e)

def COMMENTATORS_OF_A_LANGUAGE():
    try:
        language=input("Enter the language(CAPITALS): ")
        query="SELECT DISTINCT Name FROM Commentator WHERE Language=\"%s\" " % language
        cur.execute(query)
        commentators=cur.fetchall()
        for i in range(len(commentators)):
            print(commentators[i]["Name"])
    except Exception as e:
        con.rollback()
        print("Failed to get list of commentators from database")
        print(">>>>>>>>>>>>>", e)  


def AGE():
    try:
        player_id=int(input("Enter the player_id whose age is to be given: "))
        query="SELECT DOB FROM Player WHERE Player_ID=%d" % player_id
        cur.execute(query)
        result=cur.fetchall()
        DOB=result[0]["DOB"]
        query1="SELECT Age FROM Player_Date_of_Birth WHERE DOB=\"%s\" " % DOB
        cur.execute(query1)
        res=cur.fetchall()
        AGE=res[0]["Age"]
        print(AGE)
    except Exception as e:
        con.rollback()
        print("Failed to get Age of player from database")
        print(">>>>>>>>>>>>>", e)

def STADIUMS_WITH_SEATING_CAPACITY_LESS_THAN_K():
    try:
        k=int(input("Enter the value of k: "))
        query="SELECT Name FROM Stadium WHERE Maximum_seating_capacity < %d" % k
        cur.execute(query)
        result=cur.fetchall()
        for i in result:
            print(i["Name"])
    except Exception as e:
        con.rollback()
        print("Failed to get Name of stadium from database")
        print(">>>>>>>>>>>>>", e)        



def INSERT_FRANCHISE():
    try:
        print("Enter new franchise details: ")
        franchise_name=input("Enter the name of franchise: ")
        owner_name=input("Enter the name of the owner: ")
        home_stadium=input("Enter the Home stadium of the franchise: ")
        coach=input("Enter the name of the Coach of the franchise: ")
        query="INSERT INTO Franchise(Name,Owner,Home_Stadium,Coach) VALUES ('%s','%s','%s','%s')" % (franchise_name,owner_name,home_stadium,coach)
        print(query)
        cur.execute(query)
        con.commit()
        print("INSERTED INTO DATABASE")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)



def INSERT_PLAYER():
    try:
        print("Enter new player details: ")
        player_id=int(input("Enter player_id of new player: "))
        franchise_name=input("Enter franchise_name of new player: ")
        franchise_owner=input("Enter franchise_owner to which player belongs to: ")
        player_name=input("Enter the name of new player: ")
        nationality=input("Enter the nationality of new player: ")
        ipl_debut_year=input("Enter the ipl_debut_year of the new player: ")
        DOB=input("Enter the Date of Birth of new player: ")
        query="INSERT INTO Player(Player_ID,Franchise_Name,Franchise_Owner,Name,Nationality,IPL_Debut_Year,DOB) VALUES ('%d','%s','%s','%s','%s','%s','%s')" % (player_id,franchise_name,franchise_owner,player_name,nationality,ipl_debut_year,DOB)
        AGE=DOB.split('-')
        x=int(AGE[0])
        y=int(AGE[1])
        z=int(AGE[2])
        Age=age_cal(date(z,y,x))
        query1="INSERT INTO Player_Date_of_Birth(DOB,Age) VALUES(\"%s\",%d)" % (DOB,Age)
        cur.execute(query1)
        con.commit()
        print(query)
        cur.execute(query)
        con.commit()
        print("INSERTED INTO DATABASE")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

def DELETE_PLAYER():
    try:
        player_id=int(input("Enter the player_id of the player to be deleted from the database: "))     
        query1="DELETE FROM Batting_Info WHERE Player_ID=%d" % player_id
        print(query1)
        cur.execute(query1)
        con.commit()
        query2="DELETE FROM Bowling_Info WHERE Player_ID=%d" % player_id
        print(query2)
        cur.execute(query2)
        con.commit()        
        query3="DELETE FROM Wicket_Keeping_Info WHERE Player_ID=%d" % player_id
        print(query3)
        cur.execute(query3)
        con.commit()        
        query4="DELETE FROM Batsmen WHERE Player_ID=%d" % player_id
        print(query4)
        cur.execute(query4)
        con.commit()        
        query5="DELETE FROM Bowler WHERE Player_ID=%d" % player_id
        print(query5)
        cur.execute(query5)
        con.commit()        
        query6="DELETE FROM Wicket_Keeper WHERE Player_ID=%d" % player_id
        print(query6)
        cur.execute(query6)
        con.commit()          
        query7="DELETE FROM Player WHERE Player_ID=%d" % player_id
        print(query7)
        cur.execute(query7)
        con.commit()                
        print("DELETED FROM DATABASE")
    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

def DELETE_LEAGUE_SPONSOR():
    name=input("Enter the name of the League_Sponsor to be deleted: ")
    query1="DELETE FROM League_Sponsor WHERE Name=\"%s\"" % name
    print(query1)
    cur.execute(query1)
    con.commit()
    print("DELETED FROM DATABASE")

def UPDATE_COMMENTATOR_LANGUAGE():
    try:
        name=input("Enter the Name of the commentator whose language is to be updated: ")
        match_id= int(input("Enter the Match_ID in which commentator language should be updated: "))
        language=input("Enter the new language: ")
        query="UPDATE Commentator SET Language=\"%s\" WHERE Name=\"%s\" AND Match_ID=%d" % (language,name,match_id)
        cur.execute(query)
        con.commit()
        print(query)
        print("UPDATED THE DATA IN THE DATABASE")
    except Exception as e:
        con.rollback()
        print("Failed to update database")
        print(">>>>>>>>>>>>>", e) 

def UPDATE_League_SPONSORSHIP_TYPE():
    try:
        name=input("Enter the Name of the sponsor whose sponsorship type has to be changed: ")
        stype=input("Enter the new sponsorsihp type: ")
        query="UPDATE League_Sponsor SET Sponsorship_Type=\"%s\" WHERE Name=\"%s\" " % (stype,name)
        cur.execute(query)
        con.commit()
        print(query)
        print("UPDATED THE DATA IN THE DATABASE")
    except Exception as e:
        con.rollback()
        print("Failed to update database")
        print(">>>>>>>>>>>>>", e)     

def UPDATE_SEATING_CAPACITY():
    try:
        name=input("Enter the name of the stadium whose maximum seating capacity is to be updated: ")
        seat_cap=int(input("Enter updated maximum seating capacity of the stadium: "))
        query="UPDATE Stadium SET Maximum_seating_capacity=%d WHERE Name=\"%s\" " % (seat_cap,name)
        cur.execute(query)
        con.commit()
        print(query)
        print("UPDATED THE DATA IN THE DATABASE")
    except Exception as e:
        con.rollback()
        print("Failed to update database")
        print(">>>>>>>>>>>>>", e) 
        


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        INSERT_PLAYER()
    elif(ch == 2):
        INSERT_FRANCHISE()
    elif(ch == 3):
        DELETE_PLAYER()
    elif(ch == 4):
        DELETE_LEAGUE_SPONSOR()
    elif(ch==5):
        UPDATE_COMMENTATOR_LANGUAGE()
    elif(ch == 6):
        UPDATE_League_SPONSORSHIP_TYPE()
    elif(ch == 7):
        UPDATE_SEATING_CAPACITY()    
    elif(ch==8):
        GET_AVG_SCORE_BATSMEN()
    elif(ch==9):
        BOWLERS_MORE_THAN_K_WICKETS()
    elif(ch==10):
        COMMENTATORS_OF_A_LANGUAGE()   
    elif(ch==11):
        AGE()    
    elif(ch==12):
        STADIUMS_WITH_SEATING_CAPACITY_LESS_THAN_K()
    elif(ch==13):
        exit(0)                 
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=30306,
                              user="root",
                              password="venu",
                              db='IPL_DB',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Option 1[INSERT PLAYER]")  # Hire an Employee
                print("2. Option 2[INSERT FRANCHISE]")  # Fire an Employee
                print("3. Option 3[DELETE_PLAYER]")  # Promote Employee
                print("4. Option 4[DELETE_LEAGUE_SPONSOR]")  # Employee Statistics
                print("5. Option 5[UPDATE_COMMENTATOR_LANGUAGE]") 
                print("6. Option 6[UPDATE_League_SPONSORSHIP_TYPE]")
                print("7. Option 7[UPDATE_SEATING_CAPACITY]")
                print("8. Option 8[GET_AVG_SCORE_BATSMEN]")
                print("9. Option 9[BOWLERS_MORE_THAN_K_WICKETS]")
                print("10. Option 10[COMMENTATORS_OF_A_LANGUAGE]")
                print("11. Option 11[AGE]")
                print("12. Option 12[STADIUMS_WITH_SEATING_CAPACITY_LESS_THAN_K]")
                print("13. Option 13[exit]")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                dispatch(ch)
                tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
