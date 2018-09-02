# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_01_141152) do

  create_table "monit_instances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "monit_id"
    t.string "host"
    t.string "process_id"
    t.string "effective_user_running_monit"
    t.string "controlfile"
    t.string "logfile"
    t.string "pidfile"
    t.string "state_file"
    t.string "debug"
    t.string "log"
    t.string "use_syslog"
    t.string "limit_for_send_expect_buffer"
    t.string "limit_for_file_content_buffer"
    t.string "limit_for_http_content_buffer"
    t.string "limit_for_program_output"
    t.string "limit_for_network_timeout"
    t.string "limit_for_check_program_timeout"
    t.string "limit_for_service_stop_timeout"
    t.string "limit_for_service_start_timeout"
    t.string "limit_for_service_restart_timeout"
    t.string "on_reboot"
    t.string "poll_time"
    t.string "httpd_bind_address"
    t.string "httpd_portnumber"
    t.string "httpd_signature"
    t.string "httpd_auth_style"
    t.integer "monit_system_id"
  end

  create_table "monit_processes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pid_file"
    t.string "status"
    t.string "group"
    t.string "monitoring_status"
    t.string "monitoring_mode"
    t.string "on_reboot"
    t.string "pid"
    t.string "parent_pid"
    t.string "uid"
    t.string "effective_uid"
    t.string "gid"
    t.string "uptime"
    t.string "threads"
    t.string "children"
    t.string "cpu"
    t.string "cpu_total"
    t.string "memory"
    t.string "memory_total"
    t.string "data_collected"
    t.integer "monit_instance_id"
  end

  create_table "monit_systems", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "monitoring_status"
    t.string "monitoring_mode"
    t.string "on_reboot"
    t.string "load_average"
    t.string "cpu"
    t.string "memory_usage"
    t.string "swap_usage"
    t.string "uptime"
    t.string "boot_time"
    t.string "data_collected"
  end

  create_table "user_monit_systems", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "monit_system_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
