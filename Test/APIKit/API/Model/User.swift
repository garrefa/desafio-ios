/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct User : Codable {
	public let login : String?
	public let id : Int?
	public let node_id : String?
	public let avatar_url : String?
	public let gravatar_id : String?
	public let url : String?
	public let html_url : String?
	public let followers_url : String?
	public let following_url : String?
	public let gists_url : String?
	public let starred_url : String?
	public let subscriptions_url : String?
	public let organizations_url : String?
	public let repos_url : String?
	public let events_url : String?
	public let received_events_url : String?
	public let type : String?
	public let site_admin : Bool?
	public let name : String?
	public let company : String?
	public let blog : String?
	public let location : String?
	public let email : String?
	public let hireable : String?
	public let bio : String?
	public let public_repos : Int?
	public let public_gists : Int?
	public let followers : Int?
	public let following : Int?
	public let created_at : String?
	public let updated_at : String?

	enum CodingKeys: String, CodingKey {

		case login = "login"
		case id = "id"
		case node_id = "node_id"
		case avatar_url = "avatar_url"
		case gravatar_id = "gravatar_id"
		case url = "url"
		case html_url = "html_url"
		case followers_url = "followers_url"
		case following_url = "following_url"
		case gists_url = "gists_url"
		case starred_url = "starred_url"
		case subscriptions_url = "subscriptions_url"
		case organizations_url = "organizations_url"
		case repos_url = "repos_url"
		case events_url = "events_url"
		case received_events_url = "received_events_url"
		case type = "type"
		case site_admin = "site_admin"
		case name = "name"
		case company = "company"
		case blog = "blog"
		case location = "location"
		case email = "email"
		case hireable = "hireable"
		case bio = "bio"
		case public_repos = "public_repos"
		case public_gists = "public_gists"
		case followers = "followers"
		case following = "following"
		case created_at = "created_at"
		case updated_at = "updated_at"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		login = try values.decodeIfPresent(String.self, forKey: .login)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		node_id = try values.decodeIfPresent(String.self, forKey: .node_id)
		avatar_url = try values.decodeIfPresent(String.self, forKey: .avatar_url)
		gravatar_id = try values.decodeIfPresent(String.self, forKey: .gravatar_id)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		html_url = try values.decodeIfPresent(String.self, forKey: .html_url)
		followers_url = try values.decodeIfPresent(String.self, forKey: .followers_url)
		following_url = try values.decodeIfPresent(String.self, forKey: .following_url)
		gists_url = try values.decodeIfPresent(String.self, forKey: .gists_url)
		starred_url = try values.decodeIfPresent(String.self, forKey: .starred_url)
		subscriptions_url = try values.decodeIfPresent(String.self, forKey: .subscriptions_url)
		organizations_url = try values.decodeIfPresent(String.self, forKey: .organizations_url)
		repos_url = try values.decodeIfPresent(String.self, forKey: .repos_url)
		events_url = try values.decodeIfPresent(String.self, forKey: .events_url)
		received_events_url = try values.decodeIfPresent(String.self, forKey: .received_events_url)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		site_admin = try values.decodeIfPresent(Bool.self, forKey: .site_admin)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		company = try values.decodeIfPresent(String.self, forKey: .company)
		blog = try values.decodeIfPresent(String.self, forKey: .blog)
		location = try values.decodeIfPresent(String.self, forKey: .location)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		hireable = try values.decodeIfPresent(String.self, forKey: .hireable)
		bio = try values.decodeIfPresent(String.self, forKey: .bio)
		public_repos = try values.decodeIfPresent(Int.self, forKey: .public_repos)
		public_gists = try values.decodeIfPresent(Int.self, forKey: .public_gists)
		followers = try values.decodeIfPresent(Int.self, forKey: .followers)
		following = try values.decodeIfPresent(Int.self, forKey: .following)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
	}

}
