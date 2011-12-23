# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111223005838) do

  create_table "hosts", :force => true do |t|
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "inbound",             :precision => 16, :scale => 0
    t.decimal  "outbound",            :precision => 16, :scale => 0
    t.boolean  "inbound_restricted"
    t.boolean  "outbound_restricted"
  end

end
