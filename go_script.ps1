cd C:\Users\MAATAOUI\Desktop\4A_SAGI\Projet4A_V1

$teams = 
"
***********************************************************************

 #####  #####  #    #   #    #####   ###    ####  #####  #####  #####  
 #   #  #   #  #    #   #    #   #  #   #  #      #      #   #  #
 #####  #   #  #     # #     #####  #####  #      #####  #####  #####
 #      #   #  #      #      #  #   #   #  #      #      #  #       #
 #      #####  #####  #      #   #  #   #   ####  #####  #   #  #####
      
***********************************************************************"
Write-Host $teams -ForegroundColor red

do{
    $choice = Read-Host -Prompt "
    (1)  : Press '1'  to activate donkey env
    (2)  : Press '2'  to create a new car
    (3)  : Press '3'  to show list of cars
    (4)  : Press '4'  to show list of trained cars
    (5)  : Press '5'  to show list of simulated cars
    ------------------------------------------------
    (6)  : Press '6'  to be connected to the raspberry pi via ssh mode
    (q)  : Press 'q'  to quit
    "
    switch($choice)
    {
        1{ 
			#conda init powershell #important pour la premiere execution.
			conda activate donkey
            Write-Host "donkey environnement is activated"
         }

        2{  
            donkey createcar --path .\donkeycar\mycars\new_car
            Write-Host "New car is created, you can see list of cars (3)"
         }
        
        3{ 
            Write-Host "List of cars : "
            ls -l .\donkeycar\mycars 
         }

        4{ Write-Host "List of trained cars"
		   ls -l .\gym-donkeycar\mysims
		}

        5{ Write-Host "List of simulted cars"}

        6{
           $ipAddr = Read-Host -Prompt "Adress IP of the car "
           $hostName = Read-Host -Prompt "Host-name of the car "
           scp $hostName@$ipAddr+"/home/pi/mycars/firstcar/"
        }
    }
    pause
}
until($choice -eq 'q')