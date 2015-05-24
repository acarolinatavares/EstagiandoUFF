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

ActiveRecord::Schema.define(:version => 20150523214713) do

  create_table "avaliacoes", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "empresa_id"
    t.integer  "situacao_avaliacao_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "avaliacoes", ["empresa_id"], :name => "index_empresa_id_avaliacao", :unique => true
  add_index "avaliacoes", ["situacao_avaliacao_id"], :name => "index_situacao_avaliacao_id_avaliacao", :unique => true
  add_index "avaliacoes", ["usuario_id"], :name => "index_usuario_id_avaliacao", :unique => true

  create_table "comentarios", :force => true do |t|
    t.string   "texto"
    t.date     "data"
    t.integer  "usuario_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "avaliacao_id"
  end

  add_index "comentarios", ["avaliacao_id"], :name => "index_avaliacao_id_comentario", :unique => true
  add_index "comentarios", ["usuario_id"], :name => "index_usuario_id_comentario", :unique => true

  create_table "empresas", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "email"
    t.string   "site"
  end

  create_table "situacao_avaliacoes", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "senha"
    t.integer  "administrador"
    t.integer  "verificado"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
