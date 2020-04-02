/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import java.io.File;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

/**
 *
 * @author user
 */
public class Excell {

    public void Exportar() throws Exception {
        File f;
        f = new File("C:\\Users\\user\\Desktop\\Mateo\\Libro1.xls");
        Workbook wb = Workbook.getWorkbook(f);
        Sheet s = wb.getSheet(0);
        int row = s.getColumns();
        int col = s.getColumns();
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                Cell c = s.getCell(j, i);
                System.out.println(c.getContents() + "  ");
            }
            System.out.println("");
        }
    }

}
