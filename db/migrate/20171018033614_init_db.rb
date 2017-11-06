class InitDb < ActiveRecord::Migration[5.1]
  def change
    create_table :site_configs, comment: '网站基本配置' do |t|
      t.text :fields, comment: '配置内容的hash串'
      t.timestamps
    end


    #
    create_table :regions, comment: '分类' do |t|
      t.integer :parent_id, default: 0, comment: '父节点id'
      t.string  :title,     comment: '标题'
      t.text    :content,   comment: '描述'

      t.timestamps
    end

    create_table :region_users, comment: '分类的管理者' do |t|
      t.integer :region_id
      t.integer :user_id
      t.integer :role, default: 0, comment: '0-普通管理员 1-高级管理员'
      t.timestamps
    end

    # 每一棵树，相当于一本书，
    create_table :trees, comment: '一棵新的树' do |t|
      t.integer :region_id, comment: '分类id'
      t.string  :title,     comment: '标题'
      t.text    :content,   comment: '描述'
      t.integer :creator_id,    comment: '创建者'
      t.integer :status, default: 0,   comment: '状态 0-待完成  1-已完成 则在关联节点时不需要出现在待选列表中'

      t.timestamps
    end

    create_table :tree_users, comment: '协作管理书' do |t|
      t.integer :tree_id,   comment: '树id'
      t.integer :user_id,   comment: '用户id'
      t.integer :role, default: 0, comment: '权限类型 0-只读 1-可添加节点  2-可添加删除节点 3-可添加删除节点+修改书本信息'
      t.timestamps
    end

    # 每一个节点，相当于一本书里的每一个章节。 节点不一定有tree_id， 可能是自由的点，等待被安排到一颗树上
    create_table :nodes, comment: '每一个节点' do |t|
      t.integer :tree_id, comment: '树id'
      t.integer :clone_from_node_id, comment: '从原节点复制过来'
      t.string  :title,     comment: '标题'
      t.text    :content,   comment: '描述'
      t.integer :creator_id,    comment: '创建者'
      t.integer :region_id,   comment: '分类id, 冗余字段，便于查询'
      
      t.timestamps
    end

    create_table :tree_nodes, comment: '树和节点的关联' do |t|
      t.integer :tree_id
      t.integer :node_id
      t.integer :sequence, default: 0, comment: '排列顺序'

      t.timestamps
    end

    create_table :node_comments, comment: '对节点的评论' do |t|
      t.integer :node_id
      t.integer :to_comment_id, comment: '对于评论的评论'
      t.text    :content, comment: '内容'
      t.integer :creator_id
      t.timestamps
    end

    create_table :users, comment: '用户' do |t|
      t.string :account, comment: '账号'
      t.string :email
      t.string :name 
      t.string :password
      t.integer :group, default: 0, comment: '0-用户 1-管理团队'

      t.timestamps
    end

    



  end
end
