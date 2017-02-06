import Vapor
import HTTP
import VaporMustache

// set the mustache renderer for all .mustache files
View.renderers[".mustache"] = VaporZewoMustache.MustacheRenderer()


let drop = Droplet()

drop.get("lookup") { req in
    guard let group = req.data["group"]?.string else {
        throw Abort.badRequest
    }
    guard let artifact = req.data["artifact"]?.string else {
        throw Abort.badRequest
    }
    return try JSON(node: [
        "Group": group,
        "Artifact": artifact
        ])
}

drop.get("form") { req in
    return try drop.view.make
}

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("posts", PostController())

drop.run()
