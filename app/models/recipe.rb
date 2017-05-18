class Recipe < ActiveRecord::Base
  
    acts_as_taggable
      validates_presence_of :name, :source
      validates_attachment_presence :recipeimg, :message => "Must upload an image"
  
  def self.s3_config
    @@s3_config ||= YAML.load(ERB.new(File.read("#{Rails.root}/config/s3.yml")).result)[Rails.env]    
  end
  
    has_attached_file :recipeimg,
                    :styles => {
                      :large => "595x842^", :medium => "250x250^" , :thumb => "100x100^"},
                      #:source_file_options =>  {:all => '-rotate "-90>"'},
                      :storage => :s3,
                      :s3_credentials => "#{Rails.root}/config/s3.yml",
                      :bucket => "recipes_jo",
                      :path => "/:style/:id/:filename";                

                    

  
end
