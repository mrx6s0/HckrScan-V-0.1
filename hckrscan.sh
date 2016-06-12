echo "----------------------------------------------------------------------------------------------------------------------------"
echo " ......................[+]............ "
echo
echo "  Don't use to harm anyone "
echo 
echo " "Misuse is the risk you run when you have such power" [...] "
echo 
echo " We do not recommend the use of HckrScan in any military system or private corporation "
echo
echo "-----------------------------------------------------------------------------------------------------------------------------"
echo " Make yourselfs warned " 
echo 
echo "------------------------------------------------------------------------------------------------------------------------------"
echo " HckrScan V 0.1 ~ 12/06/2016 [Developed for Unix system]"
echo  
echo "# ~ by mrx"
echo  
echo "# ~ hack your way "
echo
echo "-----------------------------------------------------------------------------------------------------------------------------"
echo
echo " Use: Enter in the past where you downloaded the HckrScan, give permission with chmod + x -> then: ./hckrscan.sh [options......]"
echo
echo " Or: chmod 777 '/hckrscan.sh' ; then, ./hckrscan.sh ... or just drag to the terminal, probabilly need the permission > chmod +x "
echo " And drag again into the terminal "
echo
echo "------------------------------------------------------------------------------------------------------------------------------"
echo
echo "This program is used in conjunction with nmap, with greater stability and control over the data generated."
echo
echo "I suggest Metasploit and Armitage, to follow with a PenTest."
echo
echo
echo "Knowing the IP (network, http address, host, etc.) desired, follow with the script; generating data in plain text."
echo
echo "-------------------------------------------------------------------------------------------------------------------------------"

echo "--------------------------------------------------"
echo ">>>>>>> INFORM THE DATA [......[..... ] ==========>"
echo "--------------------------------------------------"

#///// Recebe as informacoes necessarias//// 

echo "If necessary, type 'help'."
echo
echo "Network to be monitored: [XXX.XXX.XXX.XXX],[google.com],[scanme.nmap.org],[192.168.0.103]...."
echo -n "--> "
read NETWORK
test "$NETWORK" = "help" && echo && echo "Type a valid ip." && echo "Ex.: 192.168.254.1 ou 201.1.5.3" && echo && echo -n "----> " && read NETWORK
echo
echo "NETMASK USED: [/YY],[/80],[/32], etc... (include the " "/" " for accurate results) "
echo -n " ----> "
read NETMASK
test "$NETMASK" = "help" && echo && echo "Type the Netmaskof this network." && echo "Ex.: /24 ou /16" && echo && echo -n "----> " && read NETMASK
echo
echo "parameters launched to nmap: "
echo -n "----> "
read PARAMETERS
test "$PARAMETERS" = "help" && echo && echo "Type additional monitoring parameters." && echo "Ex: -sP -A -O -sO" && echo && echo -n "----> " && read PARAMETERS
echo
echo "Save the results file in: "
echo -n "----> "
read FILE
test "$FILE" = "help" && echo && echo "Type the file name in which to save the report.." && echo "Ex.: scan.txt" && echo && echo -n "----> " && read FILE
test "$FILE" = "" && echo && echo "The report will not be saved."
echo

# ////////////Resumo dos dados coletados /////////////
echo "-------------------------------------------------"
echo "======= PREVIEW OF SCAN... ========="
echo "-------------------------------------------------"
echo "--> Network monitored: $NETWORK$NETMASK"
echo "--> Parameters used: $PARAMETERS"
echo "--> File generated: $FILE"
echo "-------------------------------------------------"

# ////////////Pede confirmação antes de prosseguir e testa a validade da resposta /////////

echo -n "Continue? [y/n]: "
read RESPOSTA
echo 
test "$RESPOSTA" = "n" && echo "Leaving..." && exit

test "$RESPOSTA" != "y" && echo "Wrong answer... leaving..." && exit

# ////////////Grava o cabeçalho com informações quantitativas dos testes no arquivo temporário /////////
echo "-------------------------------------------------" >> hckrscan.data
echo >> hckrscan.data                                       | 
echo "------------------"                                   |
echo "hckrscan v 0.1"                                       | 
echo                                                        |
echo "HckrScan v 0.1" >> hckrscan.data                      |
echo                                                        |
echo "by # ~ mrx - 12/06/2016"                              |
echo                                                        | 
echo "--------------------------------------------------"   |
echo "Network monitored: $NETWORK$NETMASK" >> hckrscan.data |
echo "Parameters used: $PARAMETERS" >> hckrscan.data        |
echo "File generated: $FILE" >> hckrscan.data               |
echo "--------------------------------------------------"   |
echo    
echo
echo >> hckrscan.data

# ///////////////// Inicia os testes e grava no arquivo temporário /////////

echo "Starting tracking... (File being generated in the main folder) [+]"
echo 
nmap $PARAMETERS $NETWORK$NETMASK >> hckrscan.data
echo
echo

#  /////////////Confirmando a conclusão dos testes, gravando data, hora e encerrando no arquivo
# ///////////////temporário

echo " Tracking successfully completed...  [+] "
echo
echo -n " Recording date and time of the procedure....  [+] "
echo
echo >> hckrscan.data
LANG=en_EUA date >> hckrscan.data
echo

echo " ........[+].. "

# ////// Exibindo resultados e gravando no arquivo escolhido

cat hckrscan.data
test "$FILE" != "" && cat hckrscan.data >> $FILE
rm hckrscan.data
echo 
echo " Script finished [+] "
echo
echo 
echo " Go to the main folder to parse the file "
echo
echo  
echo " Closing session "
echo
echo
echo
echo " ~ # mrx programmer # "
echo
echo 
echo                " ......[+].. "
