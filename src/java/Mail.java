

import static Ride.Mail.Mails;
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

public class Mail {
    
    public static void Mails(String email, String subject,String mailcontent)throws Exception {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("ride1right@gmail.com", "durgadiana");
                    }
                });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("ride1right@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email));
            message.setSubject(subject);                        
            String bodyText = mailcontent;            
            MimeBodyPart mbp2 = new MimeBodyPart();            
            DataSource source = new FileDataSource("C:\\Users\\Diana\\Desktop\\smiley.gif");
            mbp2.setDataHandler(new DataHandler(source));
            mbp2.setFileName("smiley.gif");
            mbp2.setHeader("Content-ID", "img1"); 
            MimeBodyPart mbp1 = new MimeBodyPart();
            mbp1.setContent(bodyText, "text/html");          
            Multipart mp = new MimeMultipart("related");
            mp.addBodyPart(mbp1);
            mp.addBodyPart(mbp2);            
            message.setContent(mp);
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
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
    public static void forgotPass(String email)throws Exception{
         Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from usertable where emailid ='" + email + "' ;");
        String pass = "",username="",p="";
        if(rs.next())
        {
         pass = rs.getString("pwd");
        username = rs.getString("firstname") + rs.getString("lastname");
        p = rs.getString("mobileno");
        }
        String subject="Forgot Password Mail For carpooling";
        String mailcontent = "<html><body><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"20\" background=\"cid:img1\"><tr><td><h1>Hello "+username+" ,</h1><BR><BR>"
                    + "These are your Login Details<BR>"
                    + "Name     :"+username+"<BR><BR>"
                    + "Email    :"+email+"<BR><BR>"
                    + "Password  :"+pass+"<BR><BR>"
                    + "Thank you for using our services "
                    +"</td></tr></table>"
                    + "</body></html>";        
        Mails(email , subject , mailcontent);
      //  Messaging.Message("Your Account details are Email :" + email + " Password :" + pass, p);                
    }
    
   
    public static void PostRideMail(String email, String username, String route, String stime,String etime)throws Exception {
        String subject="Posted a Ride for carpooling";
        String mailcontent = "<html><body><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"20\" background=\"cid:img1\"><tr><td><h1>Hello "+username+" ,</h1><BR><BR>"
                    + "Thank You for Posting a New Carpool Ride . Please Have a look at your details and verify them<BR>"
                    + "Name     :"+username+"<BR><BR>"
                    + "Email    :"+email+"<BR><BR>"
                    + "Ride     :"+route+"<BR><BR>"
                    + "Start    :"+stime+"<BR><BR>"
                    + "End    :"+etime+"<BR><BR><BR><BR>"
                    + "Thank you, \n"+username +"</td></tr></table>"                   
                    + "</body></html>";
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
        ResultSet rs = st.executeQuery("select * from createpool where tripid ='"+ tripid +"'");
        String driver="",phone="";
        if(rs.next()){
            driver = rs.getString("userid");
        }
        rs = st.executeQuery("select * from usertable  where userid ='"+ driver +"'");
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
        ResultSet rs = st.executeQuery("select * from sendrequest where tripid ='"+tripid+"'  ");
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
        mailcontent = "Hello "+username+" , \n\n"
                   + "\n\n A carpool Group and ride has just been deleted , the details are as follows" 
                    + "\n\n Name     :"+username+""
                    + "\n\n Email    :"+email+""
                    + "\n\n Ride     :"+route+""                                     
                    + "\n\n Thank you and Sorry for the inconvience caused.";
                  
        Mails( m, subject , mailcontent);
        }                                    
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
        mailcontent = "Hello,"
                    + "\n\nSomeone has backed out of your carpool Group with our carpool services, Please Have a look at their details <BR>"
                    + "\n\nName     :"+username+""
                    + "\n\nEmail    :"+email+""
                    + "\n\nRide     :"+route+""
                                                
                    + "\n\nThank you";
                   
        Mails( driver, subject , mailcontent); 
      //  Messaging.Message(username + " Someone has just left your ride email :" + email+", phone:"+uphone, phone);                
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
   