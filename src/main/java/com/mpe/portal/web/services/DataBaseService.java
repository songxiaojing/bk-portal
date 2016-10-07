package com.mpe.portal.web.services;

import com.mpe.portal.web.utils.Assert;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


@Service("DataBaseService")
public class DataBaseService {

    /**
     * 当前安全事件数据库连接池.
     */
    protected DataSource _dataSource;

    public DataSource getDataSource() {

        return _dataSource;
    }

    @Resource(name = "stockDataSource")
    public void setDataSource(DataSource dataSource) {

        this._dataSource = dataSource;
    }


    /**
     * 查询SQL取得结果.
     *
     * @param sql
     * @return
     */
    public List<Object[]> selectRecords(DataSource dataSource, String sql) throws Exception {

        if (Assert.isEmptyString(sql) == true || dataSource == null) {
            return null;
        }
        //
        Connection conn = null;
        Statement statment = null;
        ResultSet resultSet = null;
        List<Object[]> resulteData = new ArrayList<Object[]>();
        try {
            conn = dataSource.getConnection();
            statment = conn.createStatement();
            resultSet = statment.executeQuery(sql);
            while (resultSet.next()) {
                Object[] rowData = new Object[resultSet.getMetaData().getColumnCount()];
                for (int c = 0; c < resultSet.getMetaData().getColumnCount(); c++) {
                    rowData[c] = resultSet.getObject(c + 1);
                }
                resulteData.add(rowData);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                }
            }
            if (statment != null) {
                try {
                    statment.close();
                } catch (SQLException e) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                }
            }
        }
        return resulteData;
    }
}
