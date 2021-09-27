/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.event;

import com.group5.utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class EventDAO {
    public List<EventDTO> getListEventForUsers(String eventSearch) throws SQLException{
        List<EventDTO> list = new ArrayList<>();
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtil.getConnection();
            if(connect != null){
                String sql = "SELECT eventID, eventName,startTime, endTime, image, video "
                        + " FROM tblEvent "
                        + " WHERE eventName like ?  ";
                stm = connect.prepareStatement(sql);
                stm.setString(1, "%" + eventSearch + "%");
                rs = stm.executeQuery();
                while(rs.next()){
                    String eventID = rs.getString("eventID");
                    String eventName = rs.getString("eventName");
                    String image = rs.getString("image");
                    String video = rs.getString("video");
                    list.add(new EventDTO(eventID,eventName, image, video));
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return list;
    }
}
