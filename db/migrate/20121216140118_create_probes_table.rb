class CreateProbesTable < ActiveRecord::Migration
  def up
    create_table :probes, :force => true do |t|
      t.boolean :successful
      t.string :from_ip
      t.datetime :probed_at
      t.timestamps
    end
  end

  def down
    drop_table :probes
  end
end