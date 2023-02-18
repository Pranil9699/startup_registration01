package startup_registration.repository;

import startup_registration.model.IdeationTable;
import startup_registration.model.IdeationTeam;

import java.io.*;
import java.util.Date;
import java.util.List;
import org.hibernate.*;
import org.hibernate.Query;
import org.hibernate.query.*;
import startup_registration.helper.*;

public class GetAll_Ideation_save {

	public static IdeationTable SaveIdeationTable(IdeationTable ideation) throws IOException {

		try {
			Session session = factoryProvider.getfactory().openSession();
			Transaction tx = session.beginTransaction();
			session.save(ideation);
			tx.commit();
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return getTable(ideation);
	}

	public static void SaveIdeationTeam(IdeationTeam team) throws IOException {
		try {
			Session session1 = factoryProvider.getfactory().openSession();
			Transaction tx1 = session1.beginTransaction();
			session1.save(team);
			tx1.commit();
			session1.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@SuppressWarnings("deprecation")
	public static boolean isisStartupNameTaken(String startupname) {
		Session s = factoryProvider.getfactory().openSession();
		@SuppressWarnings("unchecked")
		Query<IdeationTable> Q = s.createQuery("from IdeationTable where startupname =: startupname");
		Q.setParameter("startupname", startupname);
		List<IdeationTable> list =  Q.list();
		
		for(@SuppressWarnings("unused") IdeationTable ideationtable : list)
		return true;
		
		return false;
	}

	@SuppressWarnings("deprecation")
	public static boolean isisStartupNameTaken_without_own(String startupname, int ideanumber) {
		Session s = factoryProvider.getfactory().openSession();
		@SuppressWarnings("unchecked")
		Query<IdeationTable> Q = s.createQuery("from IdeationTable where startupname =: startupname and ideanumber !=:ideanumber ");
		Q.setParameter("startupname", startupname);
		Q.setParameter("ideanumber", ideanumber);
		List<IdeationTable> list =  Q.list();
		
		for(@SuppressWarnings("unused") IdeationTable ideationtable : list)
		return true;
		
		return false;
	}
	/*
	 * @SuppressWarnings("deprecation")
	 
	public static int getTable(String startupname, Date date) {
		Session s = factoryProvider.getfactory().openSession();
		@SuppressWarnings("unchecked")
		Query<IdeationTable> Q = s.createQuery("from IdeationTable where startupname =: startupname and ideanumber=:ideanumber ");
		Q.setParameter("startupname", startupname);
		Q.setParameter("ideanumber", ideanumber);
		IdeationTable ideatable_id = Q.getSingleResult();
		return ideatable_id.getIdeanumber();
	}
	*/
	@SuppressWarnings("deprecation")
	public static IdeationTable updatefile_photo_name(String newFileName, String newPhotoName, IdeationTable ideationT) {
		Session session = factoryProvider.getfactory().openSession();
		Transaction tx = session.beginTransaction();

		Query<IdeationTable> Q1 = session.createQuery(
				"UPDATE IdeationTable SET date_time=:date_time,fileupload_presentation=:fileupload_presentation,team_photo_upload=:team_photo_upload WHERE ideanumber =:ideanumber ");
		Q1.setParameter("date_time", new Date());
		Q1.setParameter("fileupload_presentation", newFileName);
		Q1.setParameter("team_photo_upload", newPhotoName);
		Q1.setParameter("ideanumber", ideationT.getIdeanumber());
		System.out.println(Q1.executeUpdate());
		tx.commit();
		session.close();
		
		return getTable(ideationT);
		
	}

	static IdeationTable getTable(IdeationTable ideationT) {
		Session s = factoryProvider.getfactory().openSession();
		@SuppressWarnings("unchecked")
		Query<IdeationTable> Q = s.createQuery("from IdeationTable where startupname =: startupname and ideanumber=:ideanumber ");
		Q.setParameter("startupname", ideationT.getStartupname());
		Q.setParameter("ideanumber", ideationT.getIdeanumber());
		return Q.getSingleResult();
	}

}
