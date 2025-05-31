variable "cloudflare_account_id" {
  description = "Cloudflare account id."
  type        = string
}

variable "bookmark_logo_url" {
  default     = null
  description = "URL pointing to a file to use as the bookmark logo."
  type        = string
}

variable "bookmark_name" {
  description = "Bookmark name."
  type        = string
}

variable "bookmark_url" {
  description = "Bookmark URL."
  type        = string
}
