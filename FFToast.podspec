Pod::Spec.new do |s|
  s.name         = 'FFAES'
  s.version      = '1.0.0'
  s.summary      = 'AES128 + ECB + PKCS7 and Base64'
  s.homepage     = "https://github.com/imlifengfeng/FFAES"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "imlifengfeng" => "imlifengfeng@gmail.com" }
  s.source       = { :git => 'https://github.com/imlifengfeng/FFAES.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'FFAES/**/*.{h,m}'

end
