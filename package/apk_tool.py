# coding=utf-8
import commands
import os
import sys

reload(sys)
sys.setdefaultencoding('utf8')

# apk工具类
apk_tool_decode_cmd = 'java -jar ./resource/lib/apktool-cli-all.jar d %s -f -o %s'
apk_tool_encode_cmd = 'java -jar ./resource/lib/apktool-cli-all.jar b %s -o %s'

sign_v1_cmd = 'jarsigner -digestalg SHA1 -sigalg MD5withRSA -keystore %s -storepass %s -keypass %s %s %s'
sign_v2_cmd = 'java -jar ./resource/lib/apksigner.jar sign --ks %s --ks-key-alias %s --key-pass pass:%s --ks-pass pass:%s %s'
sign_v2_cmd_out = 'java -jar ./resource/lib/apksigner.jar sign --ks %s --ks-key-alias %s --key-pass pass:%s --ks-pass pass:%s --out %s %s'


def decode(apk_path, dist_dir):
    command = apk_tool_decode_cmd % (apk_path, dist_dir)
    print command
    (status, output) = commands.getstatusoutput(command)
    return output


def encode(decode_dir, dist_path):
    command = apk_tool_encode_cmd % (decode_dir, dist_path)
    if not os.path.exists(dist_path):
        os.mkdir(dist_path)
    print command
    (status, output) = commands.getstatusoutput(command)
    return output


# alias 生成jks时指定的alias
# key_password 签署者的密码，即生成jks时指定alias对应的密码
# key_store_password  keystore密码
def signer_v1(apk_path, keystore_path, alias, key_password, key_store_password):
    command = sign_v1_cmd % (keystore_path, key_store_password, key_password, apk_path, alias)
    print command
    return commands.getstatusoutput(command)


# alias 生成jks时指定的alias
# key_password 签署者的密码，即生成jks时指定alias对应的密码
# key_store_password  keystore密码
def apkSigner_v2(apk_path, keystore_path, alias, key_password, key_store_password):
    command = sign_v2_cmd % (keystore_path, alias, key_password, key_store_password, apk_path)
    print command
    return commands.getstatusoutput(command)


def apkSigner_v2_output(apk_path, keystore_path, alias, key_password, key_store_password, output_path):
    command = sign_v2_cmd_out % (
        keystore_path, alias, key_password, key_store_password, output_path, apk_path)
    print command
    return commands.getstatusoutput(command)
