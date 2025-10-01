#!/bin/bash
# Coder Willow McCulloch GitHub IvoryAspin
# This is a very simple game of dnd
#################################################
#                 COLORS                        #
#################################################
Bold='\033[1m'
Red='\033[0;31m'
Yellow='\033[0;33m'
Purple='\033[0;35m'
Blue='\e[0;36m'
Green='\e[0;32m'
NC='\033[0m' #No Color
#################################################
#                   DICE                        #
#################################################
D20() {
  echo $(( RANDOM % 20 + 1 ))
}

D12() {
  echo $(( RANDOM % 12 + 1 ))
}

D8() {
  echo $(( RANDOM % 8 + 1 ))
}
D6() {
  echo $(( RANDOM % 6 + 1 ))
}

D4() {
  echo $(( RANDOM % 4 + 1 ))
}
D2() {
  echo $(( RANDOM % 2 + 1 ))
}
#################################################
#                  WEAPONS                      #
#################################################
Crossbow(){
  roll20=$(D20)
  if [[ $Roll20 -gt "9" ]];
    then
    echo "◤-----◥"
    echo "| $roll20   |"
    echo "◣-----◢"
  else
    echo "◤----◥"
    echo "| $roll20  |"
    echo "◣----◢"
  fi
  roll=$(( $roll20 + 4 ))
  if (( $roll >= $Mac ));
    then
    roll6_1=$(D6)
    roll6_2=$(D6)
    damage=$(( $roll6_1 + $roll6_2 ))
    Mhp=$(( Mhp-damage ))
    echo "Thats A Hit With a of $roll and Did $damage Damage to the $Name"
  else
    echo "Attack Missed With a roll of $roll"
  fi
}
Short_Sword(){
  roll20=$(D20)
    if [[ $Roll20 -gt "9" ]];
    then
    echo "◤-----◥"
    echo "| $roll20   |"
    echo "◣-----◢"
  else
    echo "◤----◥"
    echo "| $roll20  |"
    echo "◣----◢"
  fi
  roll=$(( $roll20 + 2 ))
  if (( $roll >= $Mac ));
    then
    roll6_1=$(D6)
    roll12_1=$(D12)
    damage=$(( $roll6_1 + $roll12_1 ))
    Mhp=$(( Mhp-damage ))
    echo "Thats A Hit With a of $roll and Did $damage Damage to the $Name"
  else
  echo "Attack Missed With a roll of $roll"
  fi
}
Dagger(){
  roll20=$(D20)
    if [[ $Roll20 -gt "9" ]];
    then
    echo "◤-----◥"
    echo "| $roll20   |"
    echo "◣-----◢"
  else
    echo "◤----◥"
    echo "| $roll20  |"
    echo "◣----◢"
  fi
  roll=$(( $roll20 + 2 ))
  if (( $roll >= $Mac ));
    then
    roll4=$(D4)
    damage=$(( $roll4 + 2))
    Mhp=$(( Mhp-damage ))
    echo "Thats A Hit With a of $roll and Did $damage Damage to the $Name"
  else
    echo "Attack Missed With a roll of $roll"
  fi
}
Battle_Axe(){
  roll20=$(D20)
    if [[ $Roll20 -gt "9" ]];
    then
    echo "◤-----◥"
    echo "| $roll20   |"
    echo "◣-----◢"
  else
    echo "◤----◥"
    echo "| $roll20  |"
    echo "◣----◢"
  fi
  roll=$(( $roll20 + 2 + $RageBoun ))
  if (( $roll >= $Mac ));
    then
    roll12_1=$(D12)
    roll6_1=$(D6)
    damage=$(( $roll12_1 + $roll6_1 + $RageBoun ))
    Mhp=$(( Mhp-damage ))
    echo "Thats A Hit With a of $roll and Did $damage Damage to the $Name"
  else
    echo "Attack Missed With a roll of $roll"
  fi
}


#################################################
#                  SPELLS                       #
#################################################

Rage(){
  if (( $RageCount == 0 ));
    then
    RageBoun=4
    Cac=$(( $Cac - 4 ))
    InRage="In Rage"
    echo "Your Now Rageing"
    read -p "Press enter to continue... "
    clear
    RoomCheck
    Combatdis
  else
    echo "Your can't Range More then once"
  fi
}
Magic_Missle(){
roll6=$(D6)
if (( $roll6 > 3 ));
  then
  roll8_1=$(D8)
  roll8_2=$(D8)
  roll8_3=$(D8)
 damage=$(( $roll8_1 + $roll8_2 + $roll8_3 ))
 Mhp=$(( Mhp-damage ))
 sleep 0.3
 echo "You Shoot 3 Missles dealing $damage damage"
 read -p "Press enter to continue... "
else
  roll8_1=$(D8)
  Mhp=$(( Mhp-roll8_1 ))
 echo "You Shoot 1 Missles dealing $roll8_1 damage"
 read -p "Press enter to continue... "
fi
}
Heal_Word(){
if (( HP < SHP )); then
    roll6_1=$(D6)
    roll6_2=$(D6)
    health=$(( roll6_1 + roll6_2 + 2 ))
    HP=$(( HP + health ))
    diff=$(( HP - SHP ))
    if (( diff > 0 )); then
        HP=$(( HP - diff ))
        clear
        echo -e "Healing Word as healed you to ${Red}$HP/$SHP${NC} HP"
        read -p "Press enter to continue..."
    fi
else
   echo "You're already at max health."
   read -p "Press enter to continue..."
fi
}
#################################################
#                 Character                     #
#################################################

PC_Wizard() {
  clear
  echo "Hello Wizard"
  sleep 1
  Character=1
  HP=25
  SHP=25
  Cac=12
  SCac=12
  Cha_L1="_^_"
  Cha_L2=" O  "
  Cha_L3="/|\ "
  Cha_L4="/ \ "
  Room_SelectStart
}
PC_Barb() {
  clear
  echo "Hello Barb"
  Character=2
  HP=35
  SHP=35
  Cac=14
  SCac=14
  Cha_L0="  _  "
  Cha_L1="_|■|_"
  Cha_L2="  O  "
  Cha_L3=" /|\ "
  Cha_L4=" / \ "
  Room_SelectStart
}
PC_Barbarian() {
  clear
  echo "Hello Barbarian"
  Character=3
  HP=45
  SHP=45
  Cac=16
  SCac=16
  Cha_L1="     "
  Cha_L2=" O |D"
  Cha_L3="/|⋁  "
  Cha_L4="/ \  "
  Room_SelectStart
}

#################################################
#                  ROOMS                        #
#################################################
Room_SelectStart() {
echo "The Bartener looks at you and says you look like you know how to fight"
echo "We have been hearing srcating noise from the celler can you go and investagate"
read -p "Press Enter to continue"
clear
  echo -e "      O"
  echo -e "    / | \ "
  echo -e "   O  O  O"
  echo -e "   | / \ | "
  echo -e "   ${Red}O     O${NC}"
  echo -e "    \   / "
  echo -e "      ${Yellow}O${NC}"
  echo "L) Left or R) Right"
  read -p "> " choice
  case $choice in
    L|l)
      clear
      echo -e "      O"
      echo -e "    / | \ "
      echo -e "   ${Red}O  O${NC}  O"
      echo -e "   | / \ | "
      echo -e "   ${Yellow}O     ${NC}O"
      echo -e "    \   / "
      echo -e "      ${Purple}O${NC}"
      Room_L1
      clear
      echo -e "      O"
      echo -e "    / | \ "
      echo -e "   ${Red}O  O${NC}  O"
      echo -e "   | / \ | "
      echo -e "   ${Yellow}O     ${NC}O"
      echo -e "    \   / "
      echo -e "      ${Purple}O${NC}"
      echo "L) Left, R) Right"
      read -p "> " choice
      case $choice in
        L|l)
          clear
          echo -e "      ${Red}O${NC}"
          echo -e "    / | \ "
          echo -e "   ${Yellow}O${NC}  O  O$"
          echo -e "   | / \ | "
          echo -e "   ${Purple}O${NC}     O"
          echo -e "    \   / "
          echo -e "      ${Purple}O${NC}"
          sleep .02
          Room_L2
          clear
          echo -e "      ${Yellow}O${NC}"
          echo -e "    / | \ "
          echo -e "   ${Purple}O${NC}  O  O$"
          echo -e "   | / \ | "
          echo -e "   ${Purple}O${NC}     O"
          echo -e "    \   / "
          echo -e "      ${Purple}O${NC}"
          sleep .02
          Room_Top ;;
        R|r)
          clear
          echo -e "      ${Red}O${NC}"
          echo -e "    / | \ "
          echo -e "   O  ${Yellow}O${NC}  O"
          echo -e "   | / \ | "
          echo -e "   ${Purple}O${NC}     O"
          echo -e "    \   / "
          echo -e "      ${Purple}O${NC}"
          sleep .02
          Room_M1
          clear
          echo -e "      ${Yellow}O${NC}"
          echo -e "    / | \ "
          echo -e "   O  ${Purple}O${NC}  O"
          echo -e "   | / \ | "
          echo -e "   ${Purple}O${NC}     O"
          echo -e "    \   / "
          echo -e "      ${Purple}O${NC}"
          read -p "Press Enter to continue..."
          Room_Top ;;
        esac;;
    R|r)
      clear
      echo -e "      O"
      echo -e "    / | \ "
      echo -e "   O${Red}  O  O${NC}"
      echo -e "   | / \ | "
      echo -e "   O     ${Yellow}O${NC}"
      echo -e "    \   / "
      echo -e "      ${Purple}O${NC}"
      sleep .02
      Room_R1
      clear
      echo -e "      O"
      echo -e "    / | \ "
      echo -e "   O${Red}  O  O${NC}"
      echo -e "   | / \ | "
      echo -e "   O     ${Yellow}O${NC}"
      echo -e "    \   / "
      echo -e "      ${Purple}O${NC}"
      sleep .02
      echo "L) Left, R) Right"
      read -p "> " choice
      case $choice in
        L|l)
          clear
          echo -e "      ${Red}O${NC}"
          echo -e "    / | \ "
          echo -e "   O${Yellow}  O${NC}  O$"
          echo -e "   | / \ | "
          echo -e "   O     ${Purple}O${NC}"
          echo -e "    \   / "
          echo -e "      ${Purple}O${NC}"
          sleep .02
          Room_M1
          clear
          echo -e "      ${Yellow}O${NC}"
          echo -e "    / | \ "
          echo -e "   O${Purple}  O${NC}  O$"
          echo -e "   | / \ | "
          echo -e "   O     ${Purple}O${NC}"
          echo -e "    \   / "
          echo -e "      ${Purple}O${NC}"
          read -p "Press Enter to continue..."
          Room_Top ;;
        R|r)
          clear
          echo -e "      ${Red}O${NC}"
          echo -e "    / | \ "
          echo -e "   O  O  ${Yellow}O${NC}"
          echo -e "   | / \ | "
          echo -e "   O     ${Purple}O${NC}"
          echo -e "    \   / "
          echo -e "      ${Purple}O${NC}"
          sleep .02
          Room_R2
          clear
          echo -e "      ${Yellow}O${NC}"
          echo -e "    / | \ "
          echo -e "   O  O  ${Purple}O${NC}"
          echo -e "   | / \ | "
          echo -e "   O     ${Purple}O${NC}"
          echo -e "    \   / "
          echo -e "      ${Purple}O${NC}"
          read -p "Press Enter to continue..."
          Room_Top ;;
        esac ;;
      esac
}

#################################################
#               Rooms Setup                     #
#################################################

RoomCheck() {
  echo "$Room"
  if [[ $Room = "CL1" ]];
    then
    CL1
  elif [[ $Room = "CR1" ]];
    then
    CR1
  elif [[ $Room = "CL2" ]];
    then
    CL2
  elif [[ $Room = "CR2" ]];
    then
    CR2
  elif [[ $Room = "CM1" ]];
    then
    CM1
  else
    CTOP
  fi
}

#################################################
#                   Left                        #
#################################################

Room_L1(){
echo "As you walk down the stars into the celler you start to see a stone statue of a werewolf which you swear you just saw it move"
read -p "Press Enter to continue"
  CL1
  Room="CL1"
  Mhp=20
  MaxMhp=20
  Mac=10
  Name="Stone Statue"
  combat
}
Room_L2(){
echo "when you walk down the stairs to the landing you see a grassy feild with big white rabbit that is charging you"
read -p "Press Enter to continue"
  CL2
  Room="CL2"
  Mhp=30
  MaxMhp=30
  Mac=15
  Name="Rage Rabbit"
  combat
}
CL1(){
  clear
  echo -n "$Cha_L0"
  echo "                                        "
  echo -n "$Cha_L1"
  echo "                                   ___"
  echo -n "$Cha_L2"
  echo "                                   |*|"
  echo -n "$Cha_L3"
  echo "                                   |_|"
  echo -n "$Cha_L4"
  echo "                                   | |"
  echo "------------------------------------------------"
}
CL2(){
  clear
  echo -n "$Cha_L0"
  echo "                                      ⁔    ⁔"
  echo -n "$Cha_L1"
  echo "                                 \*\ /*/"
  echo -n "$Cha_L2"
  echo "                                  (*>*)"
  echo -n "$Cha_L3"
  echo "                                  / ^ \ "
  echo -n "$Cha_L4"
  echo "                                 / / \ \ "
  echo "------------------------------------------------"
}

#################################################
#                  Right                        #
#################################################

Room_R1(){
echo "As you walk down the stars into the celler you see a strange figure in the mist you can tell its not human but you can tell what it exectly"
read -p "Press Enter to continue"
  CR1
  Room="CR1"
  Mhp=17
  MaxMhp=17
  Mac=13
  Name="Alien"
  combat
}
Room_R2(){
echo "As you get down to the landing you noice a smoke smell coming right behind a wooden door"
read -p "Press Enter to continue"
  CR2
  Room="CR2"
  Mhp=30
  MaxMhp=30
  Mac=12
  Name="Flaming Goblin"
  combat
}
CR1(){
  clear
  echo -n "$Cha_L0"
  echo "                                        "
  echo -n "$Cha_L1"
  echo "                                   \/ "
  echo -n "$Cha_L2"
  echo "                                  ()  "
  echo -n "$Cha_L3"
  echo "                                  /\ "
  echo -n "$Cha_L4"
  echo "                                 0  O"
  echo "------------------------------------------------"
}
CR2(){
  clear
  echo -n "$Cha_L0"
  echo "                                        "
  echo -n "$Cha_L1"
  echo "                                 \-\ /-/ "
  echo -n "$Cha_L2"
  echo "                                  {*^*} "
  echo -n "$Cha_L3"
  echo "                                  / ^ \ "
  echo -n "$Cha_L4"
  echo "                                 _// \\_"
  echo "------------------------------------------------"
}

#################################################
#                 Middle                        #
#################################################
Room_M1(){
echo "As you make it to this landing you slip a bit on a blue goo and then look and and see a adult blue slime"
read -p "Press Enter to continue"
  CM1
  Room="CM1"
  Mhp=55
  MaxMhp=55
  Mac=15
  Name="Adult Slime"
  combat
}
CM1(){
  clear
  echo -n "$Cha_L0"
  echo "                                        "
  echo -n "$Cha_L1"
  echo "                                        "
  echo -n "$Cha_L2"
  echo "                                  ◜----◝"
  echo -n "$Cha_L3"
  echo "                                 (   Ö  )"
  echo -n "$Cha_L4"
  echo "                                  ◟____◞"
  echo "------------------------------------------------"
}

#################################################
#                   Top                        #
#################################################
Room_Top(){
echo "It feels colder then the rest of the celler down here and right behind the stone doors you can hear metal on metal scraking noices"
read -p "Press Enter to continue"
  CTOP
  Room="CTOP"
  Mhp=85
  MaxMhp=85
  Mac=16
  Name="Robot King (BOSS)"
  combat
}
CTOP(){
  clear
  echo -n "$Cha_L0"
  echo "                                     ⌜--⌝  "
  echo -n "$Cha_L1"
  echo "                                 |❁>|  "
  echo -n "$Cha_L2"
  echo "                                 ⌞__⌟  "
  echo -n "$Cha_L3"
  echo "                                 /  \  "
  echo -n "$Cha_L4"
  echo "                                {|  |} "
  echo "------------------------------------------------"
}


Win(){
clear
echo -e "YYYYYYY       YYYYYYY                                     WWWWWWWW                           WWWWWWWW"
echo -e "Y:::::Y       Y:::::Y                                     W::::::W                           W::::::W"
echo -e "Y:::::Y       Y:::::Y                                     W::::::W                           W::::::W"
echo -e "Y::::::Y     Y::::::Y                                     W::::::W                           W::::::W"
echo -e "YYY:::::Y   Y:::::YYYooooooooooo   uuuuuu    uuuuuu        W:::::W           WWWWW           W:::::W ooooooooooo   nnnn  nnnnnnnn"
echo -e "   Y:::::Y Y:::::Y oo:::::::::::oo u::::u    u::::u         W:::::W         W:::::W         W:::::Woo:::::::::::oo n:::nn::::::::nn"
echo -e "    Y:::::Y:::::Y o:::::::::::::::ou::::u    u::::u          W:::::W       W:::::::W       W:::::Wo:::::::::::::::on::::::::::::::nn"
echo -e "     Y:::::::::Y  o:::::ooooo:::::ou::::u    u::::u           W:::::W     W:::::::::W     W:::::W o:::::ooooo:::::onn:::::::::::::::n"
echo -e "      Y:::::::Y   o::::o     o::::ou::::u    u::::u            W:::::W   W:::::W:::::W   W:::::W  o::::o     o::::o  n:::::nnnn:::::n"
echo -e "       Y:::::Y    o::::o     o::::ou::::u    u::::u             W:::::W W:::::W W:::::W W:::::W   o::::o     o::::o  n::::n    n::::n"
echo -e "       Y:::::Y    o::::o     o::::ou::::u    u::::u              W:::::W:::::W   W:::::W:::::W    o::::o     o::::o  n::::n    n::::n"
echo -e "       Y:::::Y    o::::o     o::::ou:::::uuuu:::::u               W:::::::::W     W:::::::::W     o::::o     o::::o  n::::n    n::::n"
echo -e "       Y:::::Y    o:::::ooooo:::::ou:::::::::::::::uu              W:::::::W       W:::::::W      o:::::ooooo:::::o  n::::n    n::::n"
echo -e "    YYYY:::::YYYY o:::::::::::::::o u:::::::::::::::u               W:::::W         W:::::W       o:::::::::::::::o  n::::n    n::::n"
echo -e "    Y:::::::::::Y  oo:::::::::::oo   uu::::::::uu:::u                W:::W           W:::W         oo:::::::::::oo   n::::n    n::::n"
echo -e "    YYYYYYYYYYYYY    ooooooooooo       uuuuuuuu  uuuu                 WWW             WWW            ooooooooooo     nnnnnn    nnnnnn"
}


#################################################
#                  Combat                       #
#################################################

Combatdis(){
  echo "+------------------------------------------------------+"
  echo -e "|         ${Red}HP $HP/$SHP${NC}       ${Purple}AC:$Cac${NC}                  |"
  echo "+------------------------------------------------------+"
  echo -e "     ${Red}$Name  HP: $Mhp/$MaxMhp AC: $Mac${NC}"
  echo "◤----------------◥ ◤----------------◥ ◤----------------◥"
  echo "|                | |                | |                |"
  echo -e "|     ${Green}Attack${NC}     | |     ${Blue}Spell${NC}      | |     ${Yellow}Defend${NC}     |"
  echo "◣----------------◢ ◣----------------◢ ◣----------------◢"
  echo -e "                         ${Red}$InRage${NC}"
  echo -e "   ${Green}A) Attack           ${Blue}B) Spells          ${Yellow}C) Defend${NC}"
}
#################################################
#             Monster's Turn                    #
#################################################
MonsterTurn() {
  if (( Mhp > 0 )); then
    if (( combatTime == 0 )); then
      combatTime=1

      if [[ $Name == "Stone Statue" ]]; then
        roll2=$(D2)
        if (( roll2 == 1 )); then
          echo "The Stone Statue is going to make an attack on you."
          roll20=$(( $(D20) + 2 ))
          if (( roll20 > Cac )); then
            roll6_1=$(D6)
            roll6_2=$(D6)
            Damge=$(( roll6_1 + roll6_2 ))
            HP=$(( HP - Damge ))
            echo -e "The Stone Statue hit and did $Damge damage. You're at ${Red}$HP/$SHP${NC}"
            read -p "Press enter to continue..."
          else
            echo "The Stone Statue missed their attack."
          fi
        else
          echo "The Stone Statue is standing still."
          read -p "Press enter to continue..."
        fi

      elif [[ $Name == "Rage Rabbit" ]]; then
        echo "The Rage Rabbit is going to make an attack on you."
        roll20=$(D20)
        if (( roll20 > Cac )); then
          roll4=$(D6)
          Damge=$roll4
          HP=$(( HP - Damge ))
          echo -e "The Rage Rabbit hit and did $Damge damage. You're at ${Red}$HP/$SHP${NC}"
          read -p "Press enter to continue..."
        else
          echo "The Rage Rabbit missed their attack."
        fi

      elif [[ $Name == "Alien" ]]; then
        echo "The Alien is going to make an attack on you."
        roll20=$(( $(D20) + 3 ))
        if (( roll20 > Cac )); then
          roll12=$(D12)
          roll12_2=$(D12)
          Damge=$(( roll12 + roll12_2 ))
          HP=$(( HP - Damge ))
          echo -e "The Alien hit and did $Damge damage. You're at ${Red}$HP/$SHP${NC}"
          read -p "Press enter to continue..."
        else
          echo "The Alien missed their attack."
        fi

      elif [[ $Name == "Flaming Goblin" ]]; then
        echo "The Flaming Goblin is going to make an attack on you."
        roll20=$(D20)
        if (( roll20 > Cac )); then
          roll4=$(D4)
          roll8=$(D8)
          Damge=$(( roll4 + roll8 + 3 ))
          HP=$(( HP - Damge ))
          echo -e "The Flaming Goblin hit and did $Damge damage. You're at ${Red}$HP/$SHP${NC}"
          read -p "Press enter to continue..."
        else
          echo "The Flaming Goblin missed their attack."
        fi

      elif [[ $Name == "Adult Slime" ]]; then
        echo "The Adult Slime is going to make an attack on you."
        roll20=$(( $(D20) + 4 ))
        if (( roll20 > Cac )); then
          roll12=$(D12)
          roll2=$(D2)
          Damge=$(( roll12 * roll2 - 8 ))
          HP=$(( HP - Damge ))
          echo -e "The Adult Slime hit and did $Damge damage. You're at ${Red}$HP/$SHP${NC}"
          read -p "Press enter to continue..."
        else
          echo "The Adult Slime missed their attack."
        fi

      else
        # Default monster behavior
        roll2=$(D2)
        if (( roll2 == 1 )); then
          echo "The monster makes a surprise attack!"
          roll20=$(( $(D20) + 2 ))
          if (( roll20 > Cac )); then
            roll6_1=$(D6)
            roll6_2=$(D12)
            Damge=$(( roll6_1 + roll6_2 ))
            HP=$(( HP - Damge ))
            echo -e "The monster hit and did $Damge damage. You're at ${Red}$HP/$SHP${NC}"
            read -p "Press enter to continue..."
          else
            echo "The monster missed their attack."
          fi
        else
          if (( HP < SHP )); then
            roll6_1=$(D6)
            health=$(( roll6_1 + 2 ))
            HP=$(( HP + health ))
            diff=$(( HP - SHP ))
            if (( diff > 0 )); then
              HP=$(( HP - diff ))
            fi
            echo "The monster healed you for $health health."
            read -p "Press enter to continue..."
          fi
        fi
      fi
    fi
  fi
}
#################################################
#               Player's Turn                   #
#################################################

combat(){
  while (( $HP > 0 && $Mhp > 0 ));
    do
    RoomCheck
    Combatdis
    if [ "$Character" -eq 1 ];
      then
      MenueWiz
    elif [ "$Character" -eq 2 ];
      then
      MenueBar
    else
       RageBoun=0
       RageCount=0
       MenueRag
    fi
    combatTime=0
    InRage=""
    Cac=$SCac
  done
 if [[ $HP < 1 ]];
    then
    read -p "You Fell Short Form The Top Press Anything to Restart" Restart
    case $Restart in
      *) menu1 ;;
    esac
 fi
}
#################################################
#              Wizard's Menue                   #
#################################################

MenueWiz() {
read -p "> " COptions
case $COptions in
 A|a)
   RoomCheck
   echo "A) Crossbow +4"
   sleep .88
   Crossbow
   echo "The $Name has $Mhp left!"
   read -p "Press Enter to continue"
   clear;;
 B|b)
    echo "A) Magic Missle"
    read -p "> " Choice
    case $Choice in
      A|a) Magic_Missle ;;
    esac ;;
 C|c)
   if (( HP < SHP )); then
    roll6_1=$(D6)
    roll6_2=$(D6)
    health=$(( roll6_1 + roll6_2 + 2 ))
    HP=$(( HP + health ))
    diff=$(( HP - SHP ))

    if (( diff > 0 )); then
        HP=$(( HP - diff ))
    fi
  else
     clear
     echo "Your at max health! You can choose another option."
     read -p "Press Enter to continue..."
     RoomCheck
     Combatdis
     MenueWiz
   fi ;;
esac
MonsterTurn
}

#################################################
#               Barb's Menue                    #
#################################################

MenueBar() {
read -p "> " COptions
case $COptions in
 A|a)
   RoomCheck
   echo "             Weapons"
   echo " A) Short Sword | B) Dagger"
   read -p "> " Weapon
   case $Weapon in
     A|a) Short_Sword ;;
     B|b) Dagger ;;
   esac
   echo "The $Name has $Mhp left!"
   read -p "Press Enter to continue"
   clear;;
 B|b)
   Heal_Word ;;
 C|c)
   Cac=$(($Cac+2))
   clear
   echo "You Brace For Impact! Your Armor Class is now $Cac"
   read -p "Press Enter to continue..." ;;
esac
MonsterTurn
}
#################################################
#           Barbarian's Menue                   #
#################################################

MenueRag() {
read -p "> " COptions
case $COptions in
 A|a)
   RoomCheck
   echo "             Weapons"
   echo "            Battle Axe"
   read -p "> " Weapon
   case $Weapon in
     *) Battle_Axe ;;
   esac
   echo "The $Name has $Mhp left!"
   read -p "Press Enter to continue"
   clear;;
 B|b)
  echo "A) Rage B) Heal Word"
  read -p "> " spell
  case $spell in
    A|a)
     Rage
     MenueRag ;;
   B|b)
     Heal_Word ;;
  esac ;;
 C|c)
   Cac=$(( $Cac + 4 ))
   clear
   echo "You stare down the $Name and see it becomes scared of you for a split second"
   read -p "Press Enter to continue" ;;
esac
MonsterTurn
}


#################################################
#                 Preview                       #
#################################################
menu1(){
clear
ASCII_Art
echo 'A) Wizard B) Barb C) Barbarian'
read -p "> " Ca_choice
case $Ca_choice in
  A|a) Preview_Wizard ;;
  B|b) Preview_Barb ;;
  C|c) Preview_Barbarian ;;
  *) echo "Invalid choice. Try again." ;;
esac
}
Preview_Wizard(){
  clear
  echo "                   +-----+"
  echo "                   | _^_ |"
  echo "                   |  O  |"
  echo "                   | /|\ |"
  echo "                   | / \ |"
  echo "                   +-----+"
  echo ""
  echo "◤-----------◥ | ◤-----------◥ | ◤-----------◥"
  echo "|  Weapon   | | |   Spell   | | |  Defense  |"
  echo "|           | | |Mgc. Missle| | |    Heal   |"
  echo "| Crossbow  | | |           | | |   2D8+2   |"
  echo "◣-----------◢ | ◣-----------◢ | ◣-----------◢"
  read -p "Type Quit to see other options or Press any to contiune > " Option
  case $Option in
    Q|q|quit|Quit) menu1 ;;
    *) PC_Wizard ;;
  esac
}
Preview_Barb(){
  clear
  echo "                   +-----+"
  echo "                   |_|■|_|"
  echo "                   |  O  |"
  echo "                   | /|\ |"
  echo "                   | / \ |"
  echo "                   +-----+"
  echo ""
  echo "◤-----------◥ | ◤-----------◥ | ◤-----------◥"
  echo "|  Weapon   | | |   Spell   | | |  Defense  |"
  echo "|Short Sword| | | Heal Word | | |  Armor Up |"
  echo "|  Dagger   | | |           | | |   +2 AC   |"
  echo "◣-----------◢ | ◣-----------◢ | ◣-----------◢"
  read -p "Type Quit to see other options or Press any to contiune > " Option
  case $Option in
    Q|q|quit|Quit) menu1 ;;
    *) PC_Barb ;;
  esac
}
Preview_Barbarian(){
  clear
  echo "                   +-----+"
  echo "                   |     |"
  echo "                   | O |D|"
  echo "                   |/|⋁  |"
  echo "                   |/ \  |"
  echo "                   +-----+"
  echo ""
  echo "◤------------◥ | ◤-----------◥ | ◤-----------◥"
  echo "|   Weapon   | | |   Spell   | | |  Defense  |"
  echo "|            | | | Heal Word | | |Create FEAR|"
  echo "| Battle Axe | | |    Rage   | | |   +5 AC   |"
  echo "◣------------◢ | ◣-----------◢ | ◣-----------◢"
  read -p "Type Quit to see other options or Press any to contiune > " Option
  case $Option in
    Q|q|quit|Quit) menu1 ;;
    *) PC_Barbarian ;;
  esac
}



#################################################
#                  START                        #
#################################################

ASCII_Art(){
echo "             _             "
echo "   _^_     _|■|_           "
echo "    O        O        O |D "
echo "   /|\      /|\      /|⋁   "
echo "   / \      / \      / \   "
}
clear
echo "As you enter the Wooden Hollow Tarven you see three people sitting at a table"
read -p "Press Enter to continue"
ASCII_Art
InRage=""
echo 'A) Wizard B) Barb C) Barbarian'
read -p "> " Ca_choice
case $Ca_choice in
  A|a) Preview_Wizard ;;
  B|b) Preview_Barb ;;
  C|c) Preview_Barbarian ;;
  *) echo "Invalid choice. Try again." ;;
esac
Win
