package startup_registration.service;

import javax.servlet.http.*;
import org.apache.commons.io.FilenameUtils;
import startup_registration.service.GetAll_Ideation_service;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import startup_registration.model.IdeationTable;
import startup_registration.model.IdeationTeam;
import startup_registration.repository.GetAll_Ideation_save;
import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class GetAll_Ideation_service {
	public static IdeationTable getT(IdeationTable ideationT, Part ufileupload_presentation, Part uteam_photo_upload,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			ideationT = (IdeationTable) GetAll_Ideation_save.SaveIdeationTable(ideationT);

			String newFileName = "";
			if (ideationT.getFileupload_presentation().length() >= 1) {
				try {
					String fileExtension = FilenameUtils.getExtension(ideationT.getFileupload_presentation());
					newFileName = ideationT.getIdeanumber() + "_" + ideationT.getStartupname() + "_file."
							+ fileExtension;
					ideationT.setFileupload_presentation(newFileName);
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			String newPhotoName = "";
			if (ideationT.getTeam_photo_upload().length() >= 1) {
				try {
					String photoExtension = FilenameUtils.getExtension(ideationT.getTeam_photo_upload());
					newPhotoName = ideationT.getIdeanumber() + "_" + ideationT.getStartupname() + "_image."
							+ photoExtension;
					ideationT.setTeam_photo_upload(newPhotoName);
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			ideationT = GetAll_Ideation_save.updatefile_photo_name(newFileName, newPhotoName, ideationT);
			try {

				String folderName = request.getRealPath("/") + "files";
				File file = new File(folderName);
				if (!file.exists()) {
					if (file.mkdir()) {
						System.out.println("Directory " + folderName + " created");
					} else {
						System.out.println("Failed to create directory " + folderName);
					}
				}
				InputStream fis = ufileupload_presentation.getInputStream();
				byte[] fdata = new byte[fis.available()];
				fis.read(fdata);
				@SuppressWarnings("deprecation")
				String fpath = request.getRealPath("/") + "files" + File.separator
						+ ideationT.getFileupload_presentation();
				System.out.println(fpath);
				FileOutputStream ffos = new FileOutputStream(fpath);
				ffos.write(fdata);
				ffos.close();
			} catch (Exception e) {
				System.out.println(e);
			}
			try {
				@SuppressWarnings("deprecation")
				String folderName = request.getRealPath("/") + "images";
				File file = new File(folderName);
				if (!file.exists()) {
					if (file.mkdir()) {
						System.out.println("Directory " + folderName + " created");
					} else {
						System.out.println("Failed to create directory " + folderName);
					}
				}
				InputStream pis = uteam_photo_upload.getInputStream();
				byte[] pdata = new byte[pis.available()];
				pis.read(pdata);
				@SuppressWarnings("deprecation")
				String ppath = request.getRealPath("/") + "images" + File.separator + ideationT.getTeam_photo_upload();
				System.out.println(ppath);
				FileOutputStream pfos = new FileOutputStream(ppath);
				pfos.write(pdata);
				pfos.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return ideationT;
	}

	public static void getTT(IdeationTeam team) {
		try {
			GetAll_Ideation_save.SaveIdeationTeam(team);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	public static boolean sendEmail(String recipientEmail) {
	    boolean isSent = false;
	    String senderEmail = "takawanepranil22@gmail.com";
	    String subject = "Thank You for Joining Student Startup Registration";
	    String messageText = "Dear Sir/Miss,\n\n"
	            + "I wanted to take a moment to express my sincere thanks for joining Student Startup Registration program. We are thrilled to have you as a member of our community and are excited to see what you will accomplish.\n\n"
	            + "As a member, you will have access to a wealth of resources and support for your startup. From workshops and mentorship to funding opportunities and networking events, we are committed to helping you succeed.\n\n"
	            + "Thank you again for joining us, and I look forward to seeing the amazing things you will accomplish.\n\n"
	            + "Sincerely,\n"
	            + "Takawane Pranil\n";
	    
	    // SMTP properties
	    Properties smtpProperties = new Properties();
	    smtpProperties.put("mail.smtp.auth", true);
	    smtpProperties.put("mail.smtp.starttls.enable", true);
	    smtpProperties.put("mail.smtp.ssl.enable", true);
	    smtpProperties.put("mail.smtp.port", 465);
	    smtpProperties.put("mail.smtp.host", "smtp.gmail.com");

	    final String username = "takawanepranil22@gmail.com";
	    final String password = "qonifztsuzyswhsb";

	    Session session = Session.getInstance(smtpProperties, new Authenticator() {
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	        }
	    });

	    try {
	        Message message = new MimeMessage(session);
	        message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
	        message.setFrom(new InternetAddress(senderEmail));
	        message.setSubject(subject);
	        message.setText(messageText);

	        Transport.send(message);

	        isSent = true;
	    } catch (MessagingException e) {
	        System.err.println("Error occurred while sending the email: " + e.getMessage());
	    }

	    return isSent;
	}


	public static boolean isStartupNameTaken(String startupname) {
		boolean flag = GetAll_Ideation_save.isisStartupNameTaken(startupname);
		return flag;
	}

	public static boolean isStartupNameTaken_without_own(String startupname, int ideanumber) {
		boolean flag = GetAll_Ideation_save.isisStartupNameTaken_without_own(startupname, ideanumber);
		return flag;
	}
}