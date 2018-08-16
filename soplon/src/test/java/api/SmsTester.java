package api;




import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

/**NO UTILIZAR!, CADA VEZ QUE ENVÍA MENSAJES GASTA $$$*/
public class SmsTester {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "AC71623ceb3b800896ae352d55fd05f76e";
  public static final String AUTH_TOKEN = "45fcfd24b802a4d79901a20ae650641e";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Message message = Message.creator(new PhoneNumber("+56976448057"),
        new PhoneNumber("+56964590329"), 
        "Prueba de sms de Soplón: Notificaciones de Entretención").create();

    System.out.println(message.getSid());
  }
}