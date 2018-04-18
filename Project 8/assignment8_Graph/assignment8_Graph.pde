import java.io.*;
Table table;

void setup(){
    size(500, 500);
    table = loadTable("islandsGraph.csv", "header");
    
    for (TableRow row : table.rows()) {
      String data =row.getString("data");
      String landmasses = row.getString("landmasses");

      println(landmasses, data);
    }
}