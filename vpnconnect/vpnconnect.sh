#!/bin/bash
# Andre Luiz Machado <luizm.andre@gmail.com> 

### Variáveis -----------------------------------

VPNCONNECT="globalprotect connect --portal"
SERVER00="vpn-servidor.com"
SERVER01="vpn-servidor01.com"
SERVER02="vpn-servidor02.com"
SERVER03="vpn-servidor03.com"

#------------------------------------------------

HELP="
    $(basename $0) - utilização

    -d : desconecta do gateway
    -g : define um gateway para se conectar (1-3)
    -h : exibe menu de ajuda
    -l : lista os gateways disponíveis
    -r : reinicia a conexão (em desenvolvimento)
    -s : exibe o nome do gateway e ip
"

if [ $# -eq 0 ]; then
    echo "Você precisa escolher um gateway para se conectar!"
else
    case $1 in 
        -h)
            echo "$HELP"
        ;;
        -g)
            if [ $2 -eq 0 ]; then
                    $VPNCONNECT $SERVER00
                elif [ $2 -eq 1 ]; then
                    $VPNCONNECT $SERVER01
                elif [ $2 -eq 2 ]; then
                    $VPNCONNECT $SERVER02
                elif [ $2 -eq 3 ]; then
                    $VPNCONNECT $SERVER03
                else
                    echo "Gateway inválido!"
                    exit 1
            fi
        ;;
        -d)
            globalprotect disconnect
        ;;
        -s)
            globalprotect show --details | egrep 'Gateway Name|Gateway IP Address'
        ;;
        -r)
            echo "Desculpe! A opção de reiniciar a conexão ainda está em desenvolvimento."
        ;;
        -l)
            echo "$SERVER00"
            echo "$SERVER01"
            echo "$SERVER02"
            echo "$SERVER03"
        ;;
        *)
            echo "Opção inválida!"
            echo "$HELP"
            exit 1
        ;;
    esac
fi

#------------------------------------------------