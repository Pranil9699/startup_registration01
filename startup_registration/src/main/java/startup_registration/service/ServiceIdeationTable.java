package startup_registration.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

import startup_registration.model.IdeationTable;
import startup_registration.repository.UpdateIdeationTable;

public class ServiceIdeationTable {

	public static IdeationTable settable(IdeationTable ideationT) {
		return UpdateIdeationTable.update_table_info(ideationT);
	}

	public static IdeationTable getfile(IdeationTable ideationT, Part ufileupload_presentation,
			HttpServletResponse response, HttpServletRequest request) {
		String newFileName = "";
		if (ideationT.getFileupload_presentation().length() >= 1) {
			try {
				String fileExtension = FilenameUtils.getExtension(ideationT.getFileupload_presentation());
				newFileName = ideationT.getIdeanumber() + "_" + ideationT.getStartupname() + "_file." + fileExtension;
				ideationT.setFileupload_presentation(newFileName);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		ideationT=(IdeationTable) UpdateIdeationTable.update_table_info(ideationT);
		try {
			@SuppressWarnings("deprecation")
			String folderName = request.getRealPath("/") + "files";
			File file = new File(folderName);
			if (!file.exists()) {
				if (file.mkdir()) {
					System.out.println("Directory " + folderName + " created");
				} else {
					System.out.println("Failed to create directory " + folderName);
				}
			} else {
				System.out.println("Directory " + folderName + " already exists");
			}
			InputStream fis = ufileupload_presentation.getInputStream();
			byte[] fdata = new byte[fis.available()];
			fis.read(fdata);
			@SuppressWarnings("deprecation")
			String fpath = request.getRealPath("/") + "files" + File.separator + newFileName;
			System.out.println(fpath);
			FileOutputStream ffos = new FileOutputStream(fpath);
			ffos.write(fdata);
			ffos.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return ideationT;

	}

	public static IdeationTable getphoto(IdeationTable ideationT, Part uteam_photo_upload, HttpServletResponse response,
			HttpServletRequest request) {
		String newPhotoName = "";
		if (ideationT.getFileupload_presentation().length() >= 1) {
			try {
				String fileExtension = FilenameUtils.getExtension(ideationT.getFileupload_presentation());
				newPhotoName = ideationT.getIdeanumber() + "_" + ideationT.getStartupname() + "_image." + fileExtension;
				ideationT.setTeam_photo_upload(newPhotoName);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		ideationT=(IdeationTable) UpdateIdeationTable.update_table_info(ideationT);
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
			} else {
				System.out.println("Directory " + folderName + " already exists");
			}
			InputStream pis = uteam_photo_upload.getInputStream();
			byte[] pdata = new byte[pis.available()];
			pis.read(pdata);
			@SuppressWarnings("deprecation")
			String ppath = request.getRealPath("/") + "images" + File.separator + newPhotoName;
			System.out.println(ppath);
			FileOutputStream pfos = new FileOutputStream(ppath);
			pfos.write(pdata);
			pfos.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return ideationT;


	}

}
