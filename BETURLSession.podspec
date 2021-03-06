Pod::Spec.new do |s|
  name           = "BETURLSession"
  url            = "https://github.com/screeninteraction/#{name}"
  git_url        = "#{url}.git"
  version        = "1.0.1"
  source_files   = "#{name}/**/*.{h,m}"

  s.name         = name
  s.version      = version
  s.summary      = "NSURLSession based network library with JSON and FormURLEncoding serializers. Blocks or Delegates. Customizable with other serializers."
  s.description  = <<-DESC

                    Delegate callbacks via blocks.
                    Blocks are hold with a weak reference so you don't have to cleanup when your object is gone.
  
                    * Plugginable serializers
                    * No need for inheriting AND making a singleton
                    * Keeps track of your session with just a simple key
                    * Progress blocks for both Download and Upload
                    * Life Cycle blocks to keep track of all requests that are happening
                    * Very light weight
                    * No need to clean up after - The blocks are self maintained.
                    * Prefixed selectors.
                    * Minimum clutter on top of the public interface.
                    
                    DESC

  s.homepage     = url
  s.license      = 'MIT'
  s.author       = { "Seivan Heidari" => "seivan.heidari@icloud.com",
                     "Screen Interaction" => "seivan.heidari@screeninteraction.com" 
                    }
  
  s.source       = { :git => git_url, :tag => version}
  

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'

  s.source_files = source_files
  s.resources    = "#{name}/**/*.{implementation,private}"
  s.requires_arc = true
end
