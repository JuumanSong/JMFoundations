Pod::Spec.new do |s|
s.name         = "JMFoundations"
s.version      = "0.0.1.4"
s.summary      = "Foundations for ios."
s.homepage     = "https://github.com/JuumanSong/JMFoundations"
s.license      = "MIT"
s.author       = { "JuumanSong" => "songxiaojunappleid@163.com" }
s.platform     = :ios, "7.0"
s.source       = { :git => "https://github.com/JuumanSong/JMFoundations.git", :tag => "0.0.1.4" }
s.source_files  = "JMFoundations", "JMFoundations/**/*.{h,m}"
s.framework  = "UIKit"
end
