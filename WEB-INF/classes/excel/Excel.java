package excel;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
 
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
public class Excel {

	private static Connection getConnection(){
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/emaintainance";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,"root","root");
        }catch(ClassNotFoundException e){
            e.printStackTrace();
            System.out.println("Driver class not found. Please add MySQL connector jar in classpath");
        }catch(SQLException e){
            e.printStackTrace();
            System.out.println("Exception occured while getting Database connection");
        }
        return con;
    }
     
    public ArrayList<Object[]> getTableData(){
        ArrayList<Object[]> tableDataList = null;
        Connection con = getConnection();
        if(con != null){
            try{
                PreparedStatement ps = con.prepareStatement("SELECT * FROM faculty");
                ResultSet result = ps.executeQuery();
                tableDataList = new ArrayList<Object[]>();
                while(result.next()){
                    Object[] objArray = new Object[10];
                    objArray[0] = result.getString(1);
                    objArray[1] = result.getInt(2);
                    objArray[2] = result.getString(3);
                    objArray[3] = result.getString(4);
                    objArray[4] = result.getString(5);
                    objArray[5] = result.getString(6);
                    objArray[6] = result.getString(7);
                    objArray[7] = result.getString(8);
                    objArray[8] = result.getString(9);
                    objArray[9] = result.getString(10);
                    tableDataList.add(objArray);
                }
            }catch(SQLException e){
                e.printStackTrace();
                System.out.println("Unable to create PreparedStatement");
            }
        }
        return tableDataList;
    }
     
    public void doExport(ArrayList<Object[]> dataList){
        if(dataList != null && !dataList.isEmpty()){
            HSSFWorkbook workBook = new HSSFWorkbook();
            HSSFSheet sheet = workBook.createSheet();
            HSSFRow headingRow = sheet.createRow(0);
            headingRow.createCell((short)0).setCellValue("FACULTY NAME");
            headingRow.createCell((short)1).setCellValue("FID");
            headingRow.createCell((short)2).setCellValue("FATHER NAME");
            headingRow.createCell((short)3).setCellValue("ADRESS");
            headingRow.createCell((short)4).setCellValue("PHNO");
            headingRow.createCell((short)5).setCellValue("QUALIFICATION");
            headingRow.createCell((short)6).setCellValue("TEACH SUBJECT");
            headingRow.createCell((short)7).setCellValue("BRANCH");
            headingRow.createCell((short)8).setCellValue("DEPARTMENT");
            headingRow.createCell((short)9).setCellValue("GENDER");
            short rowNo = 1;
            for (Object[] objects : dataList) {
                HSSFRow row = sheet.createRow(rowNo);
                row.createCell((short)0).setCellValue(objects[0].toString());
                row.createCell((short)1).setCellValue(objects[1].toString());
                row.createCell((short)2).setCellValue(objects[2].toString());
                row.createCell((short)3).setCellValue(objects[3].toString());
                row.createCell((short)4).setCellValue(objects[4].toString());
                row.createCell((short)5).setCellValue(objects[5].toString());
                row.createCell((short)6).setCellValue(objects[6].toString());
                row.createCell((short)7).setCellValue(objects[7].toString());
                row.createCell((short)8).setCellValue(objects[8].toString());
                row.createCell((short)9).setCellValue(objects[9].toString());

                rowNo++;
            }
             
            String file = "D:/faculty_details.xls";
            try{
                FileOutputStream fos = new FileOutputStream(file);
                workBook.write(fos);
                fos.flush();
            }catch(FileNotFoundException e){
                e.printStackTrace();
                System.out.println("Invalid directory or file not found");
            }catch(IOException e){
                e.printStackTrace();
                System.out.println("Error occurred while writting excel file to directory");
            }
        }
    }
     
    public static void faculty() {
        Excel exporter = new Excel();
        ArrayList<Object[]> dataList = exporter.getTableData();
        if(dataList != null && dataList.size() > 0){
            exporter.doExport(dataList);
        }else{
            System.out.println("There is no data available in the table to export");
        }
    }}
