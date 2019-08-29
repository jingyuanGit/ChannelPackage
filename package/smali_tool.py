# coding=utf-8
import commands
import os
import sys

reload(sys)
sys.setdefaultencoding('utf8')

sdk_dir = './resource/resource_sdk/'

baksmali_jar_path = './resource/lib/baksmali.jar'
dx_jar_path = './resource/lib/dx.jar'
android_jar_path = './resource/lib/android.jar'

msdk_lib_dir = './resource/resource_sdk/msdk/jarlibs'


# 将dex解压smali
def bak_smali(dex_path, output_dir):
    command = 'java -jar ' + baksmali_jar_path + ' d ' + dex_path + ' -o ' + output_dir
    (status, output) = commands.getstatusoutput(command)
    print command
    if output == '':
        print "create smali success"
    else:
        print "create smali failed"
        print output


# 将jar和java文件装换为dex
def create_dex(jar_or_class_path, output_dex):
    command = 'java -jar ' + dx_jar_path + ' --dex --output=' + output_dex + ' ' + jar_or_class_path
    print command
    (status, output) = commands.getstatusoutput(command)
    return output


def get_dir_class_path(dirName):
    class_path = ''
    for rt, dirs, files in os.walk(dirName):
        class_path += rt + "/*.java "
    return class_path


# 将渠道的jar包转换成smali文件
def create_channel_smali(channel_name):
    path = sdk_dir + channel_name
    if not os.path.exists(path):
        print "channel dir not exists"
        return
    class_libs_dir = path + os.path.sep + 'jarlibs'
    dex_save_path = path + os.path.sep + 'dex' + os.path.sep
    bak_smali_dir = path + os.path.sep + 'smali' + os.path.sep
    if not os.path.exists(dex_save_path):
        os.mkdir(dex_save_path)
    if not os.path.exists(bak_smali_dir):
        os.mkdir(bak_smali_dir)
    dex_save_file = dex_save_path + 'class.dex'
    class_path = ''
    jar_path = ''
    for file_name1 in os.listdir(class_libs_dir):
        if '.jar' in file_name1:
            jar_file = os.path.join(class_libs_dir, file_name1)
            class_path += jar_file + ':'
            jar_path += jar_file + ' '
    create_dex(jar_path, dex_save_file)
    bak_smali(dex_save_file, bak_smali_dir)


# 将已经对接好的渠道实现类Java源文件，编译成class
def create_channel_access_class(channel_name):
    class_path = ''
    channel_lib_dir = sdk_dir + channel_name + os.path.sep + 'jarlibs'
    # 将融合msdk的路径添加
    for file_name in os.listdir(msdk_lib_dir):
        name = os.path.join(msdk_lib_dir, file_name)
        if os.path.isfile(name) and 'jar' in name:
            class_path += name + ':'
    # 变量去渠道下面jarlibs
    for file in os.listdir(channel_lib_dir):
        name = os.path.join(channel_lib_dir, file)
        if os.path.isfile(name) and 'jar' in name:
            class_path += name + ':'
    # 添加android.jar包位置
    class_path += android_jar_path + ':'
    class_path += get_dir_class_path(channel_lib_dir)
    # class输出文件夹
    class_output_dir = sdk_dir + channel_name + os.path.sep + 'tmp' + os.path.sep + 'class'

    if not os.path.exists(class_output_dir):
        os.mkdir(class_output_dir)
    sdk_iml_file = sdk_dir + channel_name + os.path.sep + 'access' + os.path.sep + "*.java"
    command = 'javac -source 1.6 -target 1.6 -classpath ' + class_path + ' ' + sdk_iml_file + ' -d ' + class_output_dir
    print command
    (status, output) = commands.getstatusoutput(command)
    print output


# 将已经编译好的渠道实现类class文件，编译smali
def create_channel_access_smali(channel_name):
    channel_class_dir = sdk_dir + channel_name + os.path.sep + 'tmp' + os.path.sep + 'class'
    channel_class_dex_dir = sdk_dir + channel_name + os.path.sep + 'tmp' + os.path.sep + 'dex' + os.path.sep
    if not os.path.exists(channel_class_dex_dir):
        os.mkdir(channel_class_dex_dir)
    channel_class_dex_file = channel_class_dex_dir + 'class_access.dex'
    create_dex(channel_class_dir, channel_class_dex_file)
    smali_save_dir = sdk_dir + channel_name + os.path.sep + 'smali' + os.path.sep
    if not os.path.exists(smali_save_dir):
        os.mkdir(smali_save_dir)
    if os.path.exists(channel_class_dex_file):
        bak_smali(channel_class_dex_file, smali_save_dir)
