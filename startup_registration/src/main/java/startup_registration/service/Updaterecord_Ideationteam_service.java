package startup_registration.service;

import java.util.List;

import startup_registration.model.IdeationTeam;
import startup_registration.repository.Updateteam_Ideationteam_set;

public class Updaterecord_Ideationteam_service {

//	public static void setrecord_service(int ideanumber, int srno, String name, String contact, String email, String role) {
//		Updateteam_Ideationteam_set.setrecord(ideanumber,srno,name,contact,email,role);
//	}

	public static List<IdeationTeam> setrecord_service(IdeationTeam ideationTt) {
		
		return Updateteam_Ideationteam_set.setrecord(ideationTt);
		// TODO Auto-generated method stub
		
	}
}
