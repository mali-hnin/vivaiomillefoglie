module DownloadHelpers
  TIMEOUT = 10
  PATH = Rails.root.join('tmp/downloads')

  def downloads
    Dir[PATH.join('*')]
  end

  def download
    downloads.first
  end

  def download_content
    wait_for_download
    File.read(download)
  end

  def wait_for_download
    Timeout.timeout(TIMEOUT) do
      sleep 0.1 until !downloading?
    end
  end

  def downloaded?
    !downloading? && downloads.any?
  end

  def downloading?
    downloads_folder = Pathname.new(PATH)
    downloads_folder.glob('*.crdownloads$').blank?
    binding.pry
  end

  def clear_downloads
    FileUtils.rm_f(downloads)
  end
end
