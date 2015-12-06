require 'sinatra/base'
require 'maxminddb'
class Loc < Sinatra::Base
  get '/*' do
    content_type 'text/plain'
    location_from_ip
  end

  private
  def self.db
    @db ||= MaxMindDB.new(db_file)
  end

  def self.db_file
    @db_file ||= development? ? './GeoLite2-City.mmdb' :  '/usr/share/GeoIP/GeoLite2-City.mmdb'
  end

  def ip
    Loc.development? ? '68.4.70.150' : request.ip
  end

  def location_from_ip
    result = Loc.db.lookup(ip)
    subs = result.subdivisions.map(&:name)
    [result.city.name, *subs, result.country.name].join(', ') << "\n"
  end
end
