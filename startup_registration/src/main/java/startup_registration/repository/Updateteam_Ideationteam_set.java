package startup_registration.repository;

import java.util.List;

import org.hibernate.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import startup_registration.helper.factoryProvider;
import startup_registration.model.IdeationTeam;

public class Updateteam_Ideationteam_set {

//	@SuppressWarnings("deprecation")
//	public static void setrecord(int ideanumber, int srno, String name, String contact, String email, String role) {
//		try {
//			Session s = factoryProvider.getfactory().openSession();
//			Transaction tx = s.beginTransaction();
//			Query<?> Q1=s.createQuery("UPDATE IdeationTeam set memberName=:memberName,memberPhone=:memberPhone,memberEmail=:memberEmail,memberRole=:memberRole  WHERE ideanumber =:ideanumber and teamId=: teamId");
//			Q1.setParameter("memberName",name);
//			Q1.setParameter("memberPhone",contact);
//			Q1.setParameter("memberEmail",email);
//			Q1.setParameter("memberRole",role);
//			Q1.setParameter("teamId",srno);
//			Q1.setParameter("ideanumber",ideanumber);
//			System.out.println(Q1.executeUpdate());
//		    tx.commit();
//		    s.close();
//			}
//			catch(Exception ex) {
//				ex.printStackTrace();
//			}
//		
//	}

	public static List<IdeationTeam> setrecord(IdeationTeam ideationTt) {
		try {
		Session s = factoryProvider.getfactory().openSession();
		Transaction tx = s.beginTransaction();
		Query<?> Q1=s.createQuery("UPDATE IdeationTeam set memberName=:memberName,memberPhone=:memberPhone,memberEmail=:memberEmail,memberRole=:memberRole  WHERE ideanumber =:ideanumber and teamId=: teamId");
		Q1.setParameter("memberName",ideationTt.getMemberName());
		Q1.setParameter("memberPhone",ideationTt.getMemberPhone());
		Q1.setParameter("memberEmail",ideationTt.getMemberEmail());
		Q1.setParameter("memberRole",ideationTt.getMemberRole());
		Q1.setParameter("teamId",ideationTt.getIdeationTeamId().getTeamId());
		Q1.setParameter("ideanumber",ideationTt.getIdeationTeamId().getIdeanumber());
		System.out.println(Q1.executeUpdate());
	    tx.commit();
	    s.close();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return getTable(ideationTt);
	}

	private static List<IdeationTeam> getTable(IdeationTeam ideationTt) {
		Session s = factoryProvider.getfactory().openSession();
		Query<?> Q1=s.createQuery("from IdeationTeam where ideanumber=:ideanumber");
		Q1.setParameter("ideanumber",ideationTt.getIdeationTeamId().getIdeanumber());
		List<IdeationTeam> ideationTT=(List<IdeationTeam>) Q1.getResultList();
		return ideationTT;
	}

}
