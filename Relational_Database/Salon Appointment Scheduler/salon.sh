#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi

  SERVICES=$($PSQL "SELECT service_id, name FROM services")

  echo "$SERVICES" | while read ID NAME
  do
    echo $ID $NAME | sed 's/ | /) /'
  done

  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) SERVICE "cut" ;; 
    3) SERVICE "trim";;
    2) SERVICE "color";;
    4) SERVICE "style";;
    *) MAIN_MENU "could not find that service. What would you like today?" ;;
  esac

}


SERVICE(){
    # get customer info (number)
    SERVICE_SELECTED=$1 
    SERVICE_ID_SELECTED=$($PSQL "SELECT service_id FROM services WHERE name = '$SERVICE_SELECTED'")
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    # if customer doesn't exist
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "I don't have a record for that phone number, what's your name?"
      # get new customer name
      read CUSTOMER_NAME
      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
      # echo -e "insert customer result: '$INSERT_CUSTOMER_RESULT'"
    fi
    echo -e "\nWhat time would you like your $SERVICE_SELECTED, $CUSTOMER_NAME"
    read SERVICE_TIME
    echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME." 

  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # echo -e "customer_name : $CUSTOMER_NAME \ncustomer_id is : $CUSTOMER_ID"
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  
}


MAIN_MENU