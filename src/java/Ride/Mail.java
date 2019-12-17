package Ride;

//post ride works perfectly ..O/p: sends a mail!





import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.sql.*;
import javax.mail.internet.AddressException;

public class Mail {
    
    public static void Mails(String email, String subject,String mailcontent)throws Exception {
        String from="ride1right@gmail.com";
        String pass="durgadiana";
    Properties props = System.getProperties();
  String host = "smtp.gmail.com";

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.smtp.ssl.trust", host);
    props.put("mail.smtp.user",from );
    props.put("mail.smtp.password", pass);
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");
    Session session = Session.getDefaultInstance(props);
    MimeMessage message = new MimeMessage(session);

    try {
        message.setFrom(new InternetAddress(from));
        InternetAddress toAddress = new InternetAddress(email);
        // To get the array of addresses
        
       
       message.addRecipient(Message.RecipientType.TO, toAddress);
        
        message.setSubject(subject);
        message.setText(mailcontent);
        Transport transport = session.getTransport("smtp");
        transport.connect(host, from, pass);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();

    }
    catch (AddressException ae) {
        ae.printStackTrace();
    }
    catch (MessagingException me) {
        me.printStackTrace();
    }
    }
    
    
       
    public static void forgotPass(String email)throws Exception{
       Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from usertable where emailid ='" + email + "'");
        String pass = "",username="",p="";
        if(rs.next()){
            pass = rs.getString("pwd");
        username = rs.getString("firstname") + rs.getString("lastname");
        p = rs.getString("mobileno");
        }
        String subject="Forgot Password Mail For RideRight";
       String mailcontent = "Hello "+username+" , \n\n"
                    + "These are your Login Details"
                    + "\n\n Name     :"+username+""
                    + "\n\n Email    :"+email+""
                    + "\n\n Password  :"+pass+""
                    + "\n\n Thank you for using our services ";
                      
        Mails(email , subject , mailcontent);
      //  Messaging.Message("Your Account details are Email :" + email + " Password :" + pass, p);                
    }
    
    public static void RegMail(String email, String username, String password, String address, String phone,String gender)throws Exception{        
        String subject="Registeration Mail For carpooling";
          String mailcontent = "Hello "+username+" , \n\n"
                    + "\n\nThank You for Registering with our carpool services, Please Have a look at your credentials and verify them"
                    + "\n\nName     :"+username+""
                    + "\n\nEmail    :"+email+""
                    + "\n\nPassword :"+password+""
                    + "\n\nAddress  :"+address+""
                    + "\n\n Mobile    :"+phone+""
                    + "\n\nThank you! ";
                    
        Mails(email , subject , mailcontent);
       // Messaging.Message("Hello " + username + " an  account has been registered for carpooling  Email :" + email + " Password :" + password, phone);                
    }
    
    public static void PostRideMail(String email, String username, String name, String time,String date)throws Exception {
        String subject="Posted a Ride for carpooling";
        String mailcontent = "Hello "+username+" , \n\n"
                    + "Thank You for Posting a New Carpool Ride with our carpool service, Please Have a look at your details and verify them"
                    + "\n\n Name:     "+username+"    "
                    + "\n\n Email:    "+email+"    "
                    + "\n\n Ride:     "+name+"   "
                    + "\n\n Start:    "+time+"   "
                    + "\n\n Date:      "+date+"  "
                    + "\n\n Thank you, \n"+username ;                   
                 
        Mails( email, subject , mailcontent);
    }
    public static void JoinRideMail(String email, String username, String route,String time, String date,String tripid)  throws Exception{
        String subject="Joined a Ride for carpooling";
        String mailcontent = "Hello "+username+" , \n\n"
                   + "Thank You for Joining a New Carpool Ride, Please Have a look at your details and verify them"
                    + "\n\nName     :"+username+""
                    + "\n\n Email    :"+email+""
                    + "\n\n Ride     :"+route+""
                    + "\n\n Time   :"+time+"" 
                    + "\n\n Date   :"+date+""                
                    + "\n\n Thank you, \n"+username+"";
                    
        Mails( email, subject , mailcontent);
            Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
        Statement st = con.createStatement();
      //  int tripid=32;
        ResultSet rs = st.executeQuery("select * from createpool where tripid ='" + tripid + "'");
        String driver="",phone="";
        if(rs.next()){
            driver = rs.getString("userid");
        }
        rs = st.executeQuery("select * from usertable  where userid ='" + driver + "'");
        if(rs.next()){
            driver = rs.getString("emailid");
        phone = rs.getString("mobileno");
        }
        subject="Someone Joined a Ride in your carpool Group";
         mailcontent = "Hello "+driver+" , \n\n"
                   + "\n\n Someone has joined your carpool Group with our carpool services, Please Have a look at their details <BR>"
                    + "\n\n Name     :"+username+""
                    + "\n\n Email    :"+email+""
                    + "\n\n Ride     :"+route+""
                   + "\n\n Thank you, \n"+driver+"";
                   
        Mails( driver, subject , mailcontent);
     //   Messaging.Message(username + " Someone has just entered your ride email :" + email+", phone:"+uphone, phone);                
    }  
    public static void DeleteJoinRideMail(String email, String username, String route,String tripid)throws Exception{
        String subject="Deleted a Joined Ride for carpooling";
        String mailcontent = "Hello "+username+" ,"
                    + "\n\nYou have just backed out of a joined carpool ride and group, Please Have a look at their details"
                    + "\n\nName     :"+username+">"
                    + "\n\nEmail    :"+email+""
                    + "\n\nRide     :"+route+""
                    + "\n\nThank you, \n"+username+"";
                    
        Mails( email, subject , mailcontent);
       Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from createpool where tripid ='" + tripid + "'");
        String driver="",phone="";
        if(rs.next()){
            driver = rs.getString("userid");
        }
        rs = st.executeQuery("select * from usertable where userid ='" + driver + "'");
        if(rs.next()){
            driver = rs.getString("emailid");
       // phone = rs.getString("mobileno");
        }
        subject="Someone has just gotten out of your carpool Group";
        mailcontent = "Hello  ,"
                    + "\n\nSomeone has backed out of your carpool Group with our carpool services, Please Have a look at their details <BR>"
                    + "\n\nName     :"+username+""
                    + "\n\nEmail    :"+email+""
                    + "\n\nRide     :"+route+""
                                                
                    + "\n\nThank you";
                   
        Mails( driver, subject , mailcontent); 
      //  Messaging.Message(username + " Someone has just left your ride email :" + email+", phone:"+uphone, phone);                
    }
    
    public static void DeletePostedRideMail(String email, String username,String route,String tripid) throws Exception {
        String subject="Deleted a Posted Ride for carpooling";
      String mailcontent = "Hello "+username+" , \n\n"
                  + "\n\n We are very sorry to hear that you have deleted this ride"
                    + "\n\n Name     :"+username+""
                    + "\n\n Email    :"+email+""
                    + "\n\n Ride     :"+route+""                    
                    + "\n\n Thank you, \n"+username+"";
                 
            Mails( email, subject , mailcontent);
            
            
             Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
        Statement st = con.createStatement();
        String  confirm="ACCEPTED";
        ResultSet rs = st.executeQuery("select * from sendrequest where tripid ='"+tripid+"' ");
        String members[]=new String[9],m="",uphone="";
        int pos = 0;
        while(rs.next()){
            members[pos++] = rs.getString("userid");
        }
        for(int i = 0 ; i < pos ; i++){
      rs = st.executeQuery("select * from usertable where userid ='" + members[i] + "' ");
       if(rs.next()){
      //  uphone = rs.getString("mobile");
        m = rs.getString("emailid");
        }
        subject="Deletion of a carpool Group";
        mailcontent = "Hello , \n\n"
                   + "\n\n A carpool Group and ride has just been deleted , the details are as follows" 
                    + "\n\n Name     :"+username+""
                    + "\n\n Email    :"+email+""
                    + "\n\n Ride     :"+route+""                                     
                    + "\n\n Thank you and Sorry for the inconvience caused.";
                  
        Mails( m, subject , mailcontent);
        }                                    
    }    
    
    public static void AcccountDeletion(String email, String username) throws Exception {
        String subject="Deletion of Account | RideRight";
        String mailcontent = "Hello "+username+" , \n\n"
                     + "\n\n Your Account has just been deleted as per your request , the details are as follows" 
                    + "\n\n Name     :"+username+""
                    + "\n\n Email    :"+email+""                                                         
                    + "Thank you.";
                  
        Mails( email, subject , mailcontent);        
    }
    public static void AcceptedMail(String email,String username,String driver,String driverEmail,String route,String tripdate,String triptime)throws Exception {
        String subject="Confirmed Ride Request";
        String mailcontent = "Hello "+username+""
                    + "\n\nYour ride has been accepted. "
                   + "\n\n Name    :"+driver+""
                    + "\n\nEmail    :"+driverEmail+""
                    + "\n\nRide     :"+route+""
                    + "\n\nDate    :"+tripdate+""
                    + "\n\nTime    :"+triptime+""
                    + "\n\nThank you. \n" ;                  
                    
        Mails( email, subject , mailcontent);
    }
    public static void DeclinedMail(String email,String username,String driver,String driverEmail,String route,String tripdate,String triptime)throws Exception {
        String subject="Rejected Ride Request";
        String mailcontent = "Hello "+username+""
                    + "\n\nYour ride has been declined. "
                    + "\n\n Name    :"+driver+""
                    + "\n\nEmail    :"+driverEmail+""
                    + "\n\nRide     :"+route+""
                     + "\n\nDate    :"+tripdate+""
                    + "\n\nTime    :"+triptime+""
                    + "\n\nThank you. \n" ;                  
                    
        Mails( email, subject , mailcontent);
    }
   public static void QueryMail(String email, String username, String message)throws Exception{
        String subject="Contact US Quesry from user";
        String mailcontent = "Hello admin ,"
                    + "\n\n Contact from a Customer or a future customer"
                    + "\n\n Name     :"+username+""
                    + "\n\n Email    :"+email+""
                    + "\n\n Message  :"+message+""
                    + "\n\n Thank you. ";
                   
        Mails("ride1right@gmail.com" , subject , mailcontent);
    }
}
