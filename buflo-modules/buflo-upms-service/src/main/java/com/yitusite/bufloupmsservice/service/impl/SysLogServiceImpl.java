

package com.yitusite.buflo.admin.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.yitusite.buflo.admin.mapper.SysLogMapper;
import com.yitusite.buflo.admin.service.SysLogService;
import com.yitusite.buflocommon.constant.CommonConstant;
import com.yitusite.buflocommon.entity.SysLog;
import com.yitusite.buflocommon.util.Assert;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 * 日志表 服务实现类
 * </p>
 *
 * @author buflo
 * @since 2017-11-20
 */
@Service
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLog> implements SysLogService {

    @Override
    public Boolean updateByLogId(Long id) {
        Assert.isNull(id, "日志ID为空");

        SysLog sysLog = new SysLog();
        sysLog.setId(id);
        sysLog.setDelFlag(CommonConstant.STATUS_DEL);
        sysLog.setUpdateTime(new Date());
        return updateById(sysLog);
    }
}
