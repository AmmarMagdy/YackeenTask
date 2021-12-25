//
//  ShowsAPI.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import Foundation

struct ShowsAPI {
    
    var shows = [Show]()
    
    init(from resultArray: [[String: Any]]) {
        for dic in resultArray{
            let value = Show(fromDictionary: dic)
            shows.append(value)
        }
    }
}



struct Show {

    var links : Link!
    var averageRuntime : Int!
    var ended : String!
//    var externals : External!
    var genres : [String]!
    var id : Int!
    var image : Image!
    var language : String!
    var name : String!
    var officialSite : String!
    var premiered : String!
    var rating : Rating!
    var runtime : Int!
    var status : String!
    var summary : String!
    var type : String!
    var updated : Int!
    var url : String!
    var weight : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        if let linksData = dictionary["_links"] as? [String:Any]{
                links = Link(fromDictionary: linksData)
            }
        averageRuntime = dictionary["averageRuntime"] as? Int
        ended = dictionary["ended"] as? String
//        if let externalsData = dictionary["externals"] as? [String:Any]{
//                externals = External(fromDictionary: externalsData)
//            }
        genres = dictionary["genres"] as? [String]
        id = dictionary["id"] as? Int
        if let imageData = dictionary["image"] as? [String:Any]{
                image = Image(fromDictionary: imageData)
            }
        language = dictionary["language"] as? String
        name = dictionary["name"] as? String
        officialSite = dictionary["officialSite"] as? String
        premiered = dictionary["premiered"] as? String
        if let ratingData = dictionary["rating"] as? [String:Any]{
                rating = Rating(fromDictionary: ratingData)
            }
        runtime = dictionary["runtime"] as? Int
//        if let scheduleData = dictionary["schedule"] as? [String:Any]{
//                schedule = Schedule(fromDictionary: scheduleData)
//            }
        status = dictionary["status"] as? String
        summary = dictionary["summary"] as? String
        type = dictionary["type"] as? String
        updated = dictionary["updated"] as? Int
        url = dictionary["url"] as? String
//        if let webChannelData = dictionary["webChannel"] as? [String:Any]{
//                webChannel = WebChannel(fromDictionary: webChannelData)
//            }
        weight = dictionary["weight"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if links != nil{
            dictionary["_links"] = links.toDictionary()
        }
        if averageRuntime != nil{
            dictionary["averageRuntime"] = averageRuntime
        }
        if ended != nil{
            dictionary["ended"] = ended
        }
//        if externals != nil{
//            dictionary["externals"] = externals.toDictionary()
//        }
        if genres != nil{
            dictionary["genres"] = genres
        }
        if id != nil{
            dictionary["id"] = id
        }
        if image != nil{
            dictionary["image"] = image.toDictionary()
        }
        if language != nil{
            dictionary["language"] = language
        }
        if name != nil{
            dictionary["name"] = name
        }
        if officialSite != nil{
            dictionary["officialSite"] = officialSite
        }
        if premiered != nil{
            dictionary["premiered"] = premiered
        }
        if rating != nil{
            dictionary["rating"] = rating.toDictionary()
        }
        if runtime != nil{
            dictionary["runtime"] = runtime
        }
//        if schedule != nil{
//            dictionary["schedule"] = schedule.toDictionary()
//        }
        if status != nil{
            dictionary["status"] = status
        }
        if summary != nil{
            dictionary["summary"] = summary
        }
        if type != nil{
            dictionary["type"] = type
        }
        if updated != nil{
            dictionary["updated"] = updated
        }
        if url != nil{
            dictionary["url"] = url
        }
//        if webChannel != nil{
//            dictionary["webChannel"] = webChannel.toDictionary()
//        }
        if weight != nil{
            dictionary["weight"] = weight
        }
        return dictionary
    }

}

struct Link{

    var previousepisode : Previousepisode!
    var selfLink : Previousepisode!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        if let previousepisodeData = dictionary["previousepisode"] as? [String:Any]{
                previousepisode = Previousepisode(fromDictionary: previousepisodeData)
            }
        if let selfData = dictionary["self"] as? [String:Any]{
            selfLink = Previousepisode(fromDictionary: selfData)
            }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if previousepisode != nil{
            dictionary["previousepisode"] = previousepisode.toDictionary()
        }
        if selfLink != nil{
            dictionary["self"] = self.toDictionary()
        }
        return dictionary
    }

}

struct Previousepisode{

    var href : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        href = dictionary["href"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if href != nil{
            dictionary["href"] = href
        }
        return dictionary
    }

}

struct Image{

    var medium : String!
    var original : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        medium = dictionary["medium"] as? String
        original = dictionary["original"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if medium != nil{
            dictionary["medium"] = medium
        }
        if original != nil{
            dictionary["original"] = original
        }
        return dictionary
    }

}

struct Rating{

    var average : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        average = dictionary["average"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if average != nil{
            dictionary["average"] = average
        }
        return dictionary
    }

}
