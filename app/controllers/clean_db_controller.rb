class CleanDbController < ApplicationController
  def index
    begin
      FoundLine.delete_all
      FoundFile.delete_all
      # GrepResultEntriesFoundLine.delete_all
      # GrepResultEntriesFoundFile.delete_all
      GrepResultEntry.delete_all
      GrepRaw.delete_all
      GrepMulti.delete_all
    rescue Exception => @e
    end
    count = FoundLine.count + FoundFile.count +
        # GrepResultEntriesFoundLine.count + GrepResultEntriesFoundFile.count +
        GrepResultEntry.count + GrepRaw.count
    @cleaned = count == 0 ? 'Cleaned' : "Error: \n  FoundLine.count == #{FoundLine.count}\n  FoundFile.count == #{FoundFile.count}\n  GrepResultEntry.count == #{GrepResultEntry.count}\n  GrepRaw.count == #{GrepRaw.count}\n  Exception == #{@e}\n\n"
  end
end
