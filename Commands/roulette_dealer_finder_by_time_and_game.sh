#!/etc/bash/
clear
# Some basic introductions and instructions
echo Hello, Im here to help you search your log files
echo Please use the following format to enter your data.
echo For the log date, please use 0310 for March 10.
echo For the time, please use 08:00:00 for 8:00.
echo You will also need to enter AM or PM.
echo For the game, enter 1 for Blackjack, 2 for Roulette and  3 for TexasHoldUM
echo Lets get started!

# This is a pause to allow time to read
echo -n "Press any key to continue..."
stty -echo
dd count=1 1>/dev/null 2>&1
stty echo
echo

# Lets move on
clear
echo Lets get some information. What date do you want to search? 0310, 0312 or 0315
read vardate
echo great! What time are you lookig at? 08:00:00
read vartime
echo Awsome, is that AM or PM?
read varampm
echo What game should I search? 1 for Blackjack, 2 for Roulette and 3 for TexasHoldUm
read vargame

# Conditional
if [ $vargame -eq 1 ]; then
   grep $vartime $vardate\_Dealer_schedule | grep -iw $varampm | awk -F" " '{print $1, $2, $3, $4}' > results.txt
   vargame=Blackjack
elif [ $vargame -eq 2 ]; then
   grep $vartime $vardate\_Dealer_schedule | grep -iw $varampm | awk -F" " '{print $1, $2, $5, $6}' > results.txt
   vargame=Roulette
else [ $vargame -eq 3]
   grep $vartime $vardate\_Dealer_schedule | grep -iw $varampm | awk -F" " '{print $1, $2, $7, $8}' > results.txt
   vargame=TexasHoldUM
fi

#Report Time Test 1
# clear
# echo Acording to the log file you requested,
# awk -F" " '{print $1, $2, $3, $4}' results.txt
# echo was working the $vargame area

# Report Time 2
clear
echo Here is what I found in the $vardate log.
echo Time........Employee was working $vargame
cat results.txt
