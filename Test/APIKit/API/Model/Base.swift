/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct Base : Codable {
	public let label : String?
	public let ref : String?
	public let sha : String?
	public let user : UserLight?
	public let repo : Repository?

	enum CodingKeys: String, CodingKey {

		case label = "label"
		case ref = "ref"
		case sha = "sha"
		case user = "user"
		case repo = "repo"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		label = try values.decodeIfPresent(String.self, forKey: .label)
		ref = try values.decodeIfPresent(String.self, forKey: .ref)
		sha = try values.decodeIfPresent(String.self, forKey: .sha)
		user = try values.decodeIfPresent(UserLight.self, forKey: .user)
		repo = try values.decodeIfPresent(Repository.self, forKey: .repo)
	}

}
