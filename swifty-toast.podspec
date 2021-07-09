Pod::Spec.new do |spec|
  spec.name          = 'swifty-toast'
  spec.module_name   = 'Toast'
  spec.version       = '0.0.6'
  spec.license       = 'MIT'
  spec.authors       = { 'incetro' => 'incetro@ya.ru' }
  spec.homepage      = "https://github.com/Incetro/toast.git"
  spec.summary       = 'A Swifty Framework for easy iOS toasts'
  spec.platform      = :ios, "12.0"
  spec.swift_version = '5.3'
  spec.source        = { git: "https://github.com/Incetro/toast.git", tag: "#{spec.version}" }
  spec.source_files  = "Sources/Toast/**/*.{h,swift}"
  spec.resources     = 'Sources/Toast/**/*.xcassets'
end