package startup_registration.repository;

import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import startup_registration.helper.factoryProvider;
import startup_registration.model.IdeationTable;

public class UpdateIdeationTable {

	@SuppressWarnings("deprecation")
	public static IdeationTable update_table_info(IdeationTable ideationT) {
		try {
			Session s = factoryProvider.getfactory().openSession();
			Transaction tx = s.beginTransaction();
			Query<?> Q1 = s.createQuery(
					"UPDATE IdeationTable SET date_time=:date_time,startupname=:startupname,studentname=:studentname,collegename=:collegename,email=:email,phone=:phone,painpoint=:painpoint,solution=:solution,prototypestatus=:prototypestatus,technology_knowhow=:technology_knowhow,skills_to_acquire=:skills_to_acquire,hobbies=:hobbies,teamsize=:teamsize,college_mentor=:college_mentor,team_photo_upload=:team_photo_upload,fileupload_presentation=:fileupload_presentation WHERE ideanumber =:ideanumber ");
			Q1.setParameter("date_time", ideationT.getDate_time());
			Q1.setParameter("startupname", ideationT.getStartupname());
			Q1.setParameter("studentname", ideationT.getStudentname());
			Q1.setParameter("collegename", ideationT.getCollegename());
			Q1.setParameter("email",ideationT.getEmail());
			Q1.setParameter("phone", ideationT.getPhone());
			Q1.setParameter("painpoint", ideationT.getPainpoint());
			Q1.setParameter("solution", ideationT.getSolution());
			Q1.setParameter("prototypestatus", ideationT.getPrototypestatus());
			Q1.setParameter("technology_knowhow", ideationT.getTechnology_knowhow());
			Q1.setParameter("skills_to_acquire", ideationT.getSkills_to_acquire());
			Q1.setParameter("hobbies", ideationT.getHobbies());
			Q1.setParameter("teamsize", ideationT.getTeamsize());
			Q1.setParameter("college_mentor", ideationT.getCollege_mentor());
			Q1.setParameter("fileupload_presentation", ideationT.getFileupload_presentation());
			Q1.setParameter("team_photo_upload", ideationT.getTeam_photo_upload());
			Q1.setParameter("ideanumber", ideationT.getIdeanumber());
			System.out.println(Q1.executeUpdate());
			tx.commit();
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return GetAll_Ideation_save.getTable(ideationT);
	}
}
