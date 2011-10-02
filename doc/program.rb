class Person < ActiveRecord::Base
  validates_each :first_name, :last_name do |record, attr, value|
    record.errors.add attr, 'starts with z.' if value[0] == ?z
  end
end


respond_to do |format|
  format.html # index.html.erb
  format.xml  { render :xml => @items }
  format.xls do
    excel = Item.get_excel

    send_file(excel.get_spreadsheet_tempfile_name,
              :type => 'application/vnd.ms-excel',
              :disposition => 'attachment',
              :filename => excel.get_destination_filename)
  end
end

