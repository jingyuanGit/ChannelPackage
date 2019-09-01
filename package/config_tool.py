#!/usr/bin/env python
# coding=utf-8
import sys
from xml.dom.minidom import parse
import xml.dom.minidom

reload(sys)
sys.setdefaultencoding('utf8')


def create_msdk_config(config_path, msdk_config, channel_config):
    conf_arr = [
        'gameId=' + msdk_config['gameId'] + '\n',
        'channelId=' + msdk_config['channelId'] + '\n',
        'channelName=' + msdk_config['channelName'] + '\n',
        'channelClass=' + msdk_config['channelClass'] + '\n',
        'host=' + msdk_config['host'] + '\n']
    for (k, v) in channel_config.items():
        conf_arr.append(k + '=' + v + '\n')
    conf = open(config_path, 'w')
    conf.writelines(conf_arr)
    conf.close()
    print '渠道' + msdk_config['channelName'] + ' 生成配置文件（MSdkConfig.properties）完成'
