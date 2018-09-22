
package com.yitusite.buflocommon.vo;

import com.yitusite.buflocommon.entity.SysLog;
import lombok.Data;

import java.io.Serializable;

/**
 * @author bulfo
 * @date 2017/11/20
 */
@Data
public class LogVO implements Serializable {
    private static final long serialVersionUID = 1L;

    private SysLog sysLog;
    private String username;
}
