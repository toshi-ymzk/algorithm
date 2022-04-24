
import Foundation

class Graph {
    let data: String
    var edges: [Graph] = []
    
    var clone: Graph?
    
    init(data: String, edges: [Graph] = []) {
        self.data = data
        self.edges = edges
    }
}

func clone(_ graph: Graph) -> Graph {
    let clonedGraph = Graph(data: graph.data)
    graph.clone = clonedGraph
    guard graph.edges.count > 0 else {
        return clonedGraph
    }
    clonedGraph.edges = graph.edges.map {
        if let clonedGraph = $0.clone {
            return clonedGraph
        } else {
            return clone($0)
        }
    }
    return clonedGraph
}

private var testCaseNumber = 1;

var checkedGraphs: [Graph] = []

extension Graph {
    // Compare data and pointer
    func compare(with: Graph) -> Bool {
        return self.data == with.data && self !== with
    }
    
    func isClone(of: Graph) -> Bool {
        var graphData = "\(data)"
        var result = self.compare(with: of)
        self.edges.enumerated().forEach {
            graphData.append("\n- \(of.edges[$0.offset].data)")
            result = of.edges[$0.offset].compare(with: $0.element)
        }
        print(graphData)
        checkedGraphs.append(self)
        self.edges.enumerated().forEach {
            if !$0.element.isChecked {
                result = $0.element.isClone(of: of.edges[$0.offset])
            }
        }
        return result
    }
    
    var isChecked: Bool {
        var isChecked = false
        checkedGraphs.forEach {
            if self === $0 {
                isChecked = true
            }
        }
        return isChecked
    }
}

var count = 0

private func check(input: Graph, output: Graph) {
    let result = output.isClone(of: input)
    if result {
        print("\u{2713} Test #\(testCaseNumber)")
    } else {
        print("\u{2717} Test #\(testCaseNumber) Expected: \(input) Output: \(output)")
    }
    testCaseNumber += 1
}

let graph: Graph = {
    let graphArr: [Graph] = (1...4).map { Graph(data: String($0))}
    graphArr[0].edges = [graphArr[1], graphArr[2]]
    graphArr[1].edges = [graphArr[0], graphArr[2], graphArr[3]]
    graphArr[2].edges = [graphArr[0], graphArr[1], graphArr[3]]
    graphArr[3].edges = [graphArr[1], graphArr[2]]
    
    return graphArr[0]
}()
check(input: graph, output: clone(graph))
