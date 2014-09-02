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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140901220132) do

  create_table "admin", force: true do |t|
    t.string   "cuadro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
  end

  create_table "campos_menus", force: true do |t|
    t.integer  "menu_id"
    t.string   "controller"
    t.string   "action"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jumbotrons", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
    t.string   "picture"
  end

  create_table "menus", force: true do |t|
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thumbnail_groups", force: true do |t|
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thumbnails", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "picture"
    t.string   "link"
    t.integer  "thumbnail_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "usuario"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
