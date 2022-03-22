#!/bin/bash
set -e

LOGFILE="/tmp/gpbackup_speedtest_plugin.log"
STATFILE="/tmp/gpbackup_speedtest_plugin_stats.log"

touch $LOGFILE 2>&1
touch $STATFILE 2>&1

setup_plugin_for_backup(){
  # config_path, local_backup_directory, scope, contentID

  CUR_DATETIME=`date +"%Y-%m-%d %H:%M:%S%Z"`
  echo "$CUR_DATETIME setup_plugin_for_backup $1 $2 $3 $4" >> $LOGFILE 2>&1
  if [ "$3" = "master" ]
    then echo "$CUR_DATETIME setup_plugin_for_backup was called for scope = master" >> $LOGFILE 2>&1
  elif [ "$3" = "segment_host" ]
    then echo "$CUR_DATETIME setup_plugin_for_backup was called for scope = segment_host" >> $LOGFILE 2>&1
  elif [ "$3" = "segment" ]
    then echo "$CUR_DATETIME setup_plugin_for_backup was called for scope = segment" >> $LOGFILE 2>&1
  fi
}

setup_plugin_for_restore(){
  # config_path, local_backup_directory, scope, contentID

  CUR_DATETIME=`date +"%Y-%m-%d %H:%M:%S%Z"`
  echo "$CUR_DATETIME setup_plugin_for_restore $1 $2 $3 $4" >> $LOGFILE 2>&1
  if [ "$3" = "master" ]
    then echo "$CUR_DATETIME setup_plugin_for_restore was called for scope = master" >> $LOGFILE 2>&1
  elif [ "$3" = "segment_host" ]
    then echo "$CUR_DATETIME setup_plugin_for_restore was called for scope = segment_host" >> $LOGFILE 2>&1
  elif [ "$3" = "segment" ]
    then echo "$CUR_DATETIME setup_plugin_for_restore was called for scope = segment" >> $LOGFILE 2>&1
  fi
}

cleanup_plugin_for_backup(){
  # config_path, local_backup_directory, scope, contentID

  CUR_DATETIME=`date +"%Y-%m-%d %H:%M:%S%Z"`
  echo "$CUR_DATETIME cleanup_plugin_for_backup $1 $2 $3 $4" >> $LOGFILE 2>&1
  if [ "$3" = "master" ]
    then echo "$CUR_DATETIME cleanup_plugin_for_backup was called for scope = master" >> $LOGFILE 2>&1
  elif [ "$3" = "segment_host" ]
    then echo "$CUR_DATETIME cleanup_plugin_for_backup was called for scope = segment_host" >> $LOGFILE 2>&1
  elif [ "$3" = "segment" ]
    then echo "$CUR_DATETIME cleanup_plugin_for_backup was called for scope = segment" >> $LOGFILE 2>&1
  fi
}

cleanup_plugin_for_restore(){
  # config_path, local_backup_directory, scope, contentID

  CUR_DATETIME=`date +"%Y-%m-%d %H:%M:%S%Z"`
  echo "$CUR_DATETIME cleanup_plugin_for_restore $1 $2 $3 $4" >> $LOGFILE 2>&1
  if [ "$3" = "master" ]
    then echo "$CUR_DATETIME cleanup_plugin_for_restore was called for scope = master" >> $LOGFILE 2>&1
  elif [ "$3" = "segment_host" ]
    then echo "$CUR_DATETIME cleanup_plugin_for_restore was called for scope = segment_host" >> $LOGFILE 2>&1
  elif [ "$3" = "segment" ]
    then echo "$CUR_DATETIME cleanup_plugin_for_restore was called for scope = segment" >> $LOGFILE 2>&1
  fi
}

backup_file() {
  # config_path, filepath_to_back_up

  CUR_DATETIME=`date +"%Y-%m-%d %H:%M:%S%Z"`
  echo "$CUR_DATETIME backup_file $1 $2" >> $LOGFILE 2>&1
  START_DATETIME=`date +"%Y-%m-%d %H:%M:%S%Z"`
  COUNTS=`cat $2 | wc -l -c`
  END_DATETIME=`date +"%Y-%m-%d %H:%M:%S%Z"`
  echo 'backup_file $2 $COUNTS $START_DATETIME $END_DATETIME' >> $STATFILE 2>&1
}

restore_file() {
  # config_path, filepath_to_restore

  #echo "restore_file $1 $2" >> /tmp/plugin_out.txt
  #filename=`basename "$2"`
  #timestamp_dir=`basename $(dirname "$2")`
  #timestamp_day_dir=${timestamp_dir%??????}
  #cat /tmp/plugin_dest/$timestamp_day_dir/$timestamp_dir/$filename > $2
}

backup_data() {
  # config_path, data_filekey

  CUR_DATETIME=`date +"%Y-%m-%d %H:%M:%S%Z"`
  echo "$CUR_DATETIME backup_data $1 $2" >> $LOGFILE 2>&1
  START_DATETIME=`date +"%Y-%m-%d %H:%M:%S%Z"`
  COUNTS=`cat - | wc -l -c`
  END_DATETIME=`date +"%Y-%m-%d %H:%M:%S%Z"`
  echo 'backup_data $2 $COUNTS $START_DATETIME $END_DATETIME' >> $STATFILE 2>&1
  cat - > /tmp/plugin_dest/$timestamp_day_dir/$timestamp_dir/$filename
}

restore_data() {
  # config_path, data_filekey

  #echo "restore_data $1 $2" >> /tmp/plugin_out.txt
  #filename=`basename "$2"`
  #timestamp_dir=`basename $(dirname "$2")`
  #timestamp_day_dir=${timestamp_dir%??????}
  #cat /tmp/plugin_dest/$timestamp_day_dir/$timestamp_dir/$filename
}

delete_backup() {
  # config_path, timestamp

  #echo "delete_backup $1 $2" >> /tmp/plugin_out.txt
  #timestamp_day_dir=${2%??????}
  #rm -rf /tmp/plugin_dest/$timestamp_day_dir/$2
  #if [ -z "$(ls -A /tmp/plugin_dest/$timestamp_day_dir/)" ] ; then
  #  rm -rf /tmp/plugin_dest/$timestamp_day_dir
  #fi
}

plugin_api_version(){
  # None

  CUR_DATETIME=`date +"%Y-%m-%d %H:%M:%S%Z"`
  echo "0.1.1"
  echo "$CUR_DATETIME 0.1.1" >> $LOGFILE 2>&1
}

--version(){
  # None

  CUR_DATETIME=`date +"%Y-%m-%d %H:%M:%S%Z"`
  echo "speedtest_plugin version 0.1.1"
  echo "$CUR_DATETIME speedtest_plugin version 0.1.1" >> $LOGFILE 2>&1
}

"$@"
